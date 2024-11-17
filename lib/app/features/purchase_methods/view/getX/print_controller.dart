import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import 'package:screenshot/screenshot.dart';
import 'package:image/image.dart' as img;

class BluetoothController extends GetxController {
  final ScreenshotController screenshotController = ScreenshotController();
  Rx<BluetoothDevice?> connectedDevice = Rx<BluetoothDevice?>(null);
  RxList<BluetoothDevice> devicesList = <BluetoothDevice>[].obs;
  RxBool isConnected = false.obs;
  RxBool isLoading = false.obs;

  // Check and request Bluetooth permissions, then turn it on if needed
  Future<void> checkAndRequestBluetooth() async {
    BluetoothAdapterState adapterState =
        await FlutterBluePlus.adapterState.first;
    bool isBluetoothOn = (adapterState == BluetoothAdapterState.on);

    if (!isBluetoothOn) {
      // Request necessary permissions for Bluetooth usage
      await Permission.bluetoothConnect.request();
      await Permission.bluetoothScan.request();

      // Attempt to turn on Bluetooth and wait for it to activate
      FlutterBluePlus.turnOn();
      while (!isBluetoothOn) {
        await Future.delayed(const Duration(seconds: 1));
        adapterState = await FlutterBluePlus.adapterState.first;
      }

      // Notify user about the Bluetooth status
      if (!isBluetoothOn) {
        Get.snackbar("خطأ", "تعذر تشغيل البلوتوث.");
      } else {
        Get.snackbar("نجاح", "تم تشغيل البلوتوث بنجاح.");
        startScan(); // Begin scanning if Bluetooth is successfully activated
      }
    } else {
      startScan(); // Begin scanning if Bluetooth was already on
    }
  }

  // Start scanning for available Bluetooth devices
  void startScan() async {
    isLoading.value = true;
    devicesList.clear();

    // Start the scan with a timeout of 4 seconds
    FlutterBluePlus.startScan(timeout: const Duration(seconds: 3));
    FlutterBluePlus.scanResults.listen((results) {
      devicesList.value = results
          .map((r) => r.device)
          .where((device) => device.advName.isNotEmpty)
          .toList();
    });

    // Add already connected devices to the list
    List<BluetoothDevice> bondedDevices = FlutterBluePlus.connectedDevices;
    devicesList
        .addAll(bondedDevices.where((device) => device.advName.isNotEmpty));

    // Delay to ensure scanning is complete
    await Future.delayed(const Duration(seconds: 3));
    isLoading.value = false;

    // Show a notification based on the scan results
    if (devicesList.isEmpty) {
      Get.snackbar(
          "لم يتم العثور على أجهزة", "لم يتم العثور على أي جهاز بلوتوث.");
    } else {
      Get.snackbar(
          "تم العثور على أجهزة", "تم العثور على ${devicesList.length} أجهزة.");
    }
  }

  // Connect to a specific Bluetooth device
  Future<void> connectToDevice(BluetoothDevice device) async {
    try {
      bool connectionStatus = await PrintBluetoothThermal.connectionStatus;
      if (!connectionStatus) {
        await PrintBluetoothThermal.connect(
            macPrinterAddress: device.remoteId.toString());
      }

      connectedDevice.value = device;
      isConnected.value = true;
      Get.snackbar("تم الاتصال", "تم الاتصال بـ ${device.advName} بنجاح.");
    } catch (e) {
      Get.snackbar("خطأ", "فشل الاتصال بـ ${device.advName}: $e");
    }
  }

  // Disconnect from the current Bluetooth device
  Future<void> disconnectDevice() async {
    await connectedDevice.value?.disconnect().then(
      (value) {
        connectedDevice.value = null;
        isConnected.value = false;
        Get.snackbar("تم قطع الاتصال", "تم قطع الاتصال مع الجهاز.");
      },
    );
  }

  // Capture a screenshot and print it
  Future<void> captureAndPrint(Uint8List? screenshot1111) async {
    if (!isConnected.value || connectedDevice.value == null) {
      Get.snackbar("خطأ", "لم يتم توصيل أي طابعة.");
      return;
    }

    // Capture the screenshot and handle image printing
    screenshotController.capture().then((Uint8List? screenshot) async {
      // if (screenshot == null) {
      //   Get.snackbar("خطأ", "فشل التقاط لقطة الشاشة.");
      //   return;
      // }

      try {
        final profile = await CapabilityProfile.load();
        List<int> bytes = [];
        final generator = Generator(PaperSize.mm58, profile);

        // Convert the screenshot to image bytes and send it to the printer
        final ByteData data = ByteData.sublistView(screenshot1111!);
        final Uint8List bytesImg = data.buffer.asUint8List();
        final image = img.copyResize(
          img.decodeImage(bytesImg)!,
          width: 370,
        );

        bytes += generator.image(image, align: PosAlign.center);

        bool result = await PrintBluetoothThermal.writeBytes(bytes);
        if (result) {
          Get.snackbar("نجاح", "تمت الطباعة بنجاح.");
        } else {
          Get.snackbar("خطأ", "فشل الطباعة.");
        }
      } catch (e) {
        Get.snackbar("خطأ", "فشل الطباعة: $e");
      }
    }).catchError((error) {
      Get.snackbar("خطأ", "فشل التقاط لقطة الشاشة: $error");
    });
  }
}
