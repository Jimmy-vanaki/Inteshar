import 'package:get/get.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import 'package:screenshot/screenshot.dart';
import 'package:inteshar/app/config/constants.dart';
import 'package:inteshar/app/config/status.dart';

class BluetoothController extends GetxController {
  final ScreenshotController screenshotController = ScreenshotController();
  RxList devicesList = [].obs;
  RxBool isConnected = false.obs;
  RxBool isLoading = false.obs;
  RxBool printed = false.obs;
  RxString deviceName = ''.obs;
  var rxRequestStatus = Status.initial.obs;

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
        Get.closeAllSnackbars();
        Get.snackbar("خطأ", "تعذر تشغيل البلوتوث.");
      } else {
        Get.closeAllSnackbars();
        Get.snackbar("نجاح", "تم تشغيل البلوتوث بنجاح.");
        startScan();
      }
    } else {
      startScan(); // Begin scanning if Bluetooth was already on
    }
  }

  // Start scanning for available Bluetooth devices
  void startScan() async {
    try {
      isLoading.value = true; // Start loading indicator
      devicesList.clear(); // Clear the previous device list

      // Fetch paired Bluetooth devices
      final List<BluetoothInfo> listResult =
          await PrintBluetoothThermal.pairedBluetooths;

      // Add paired devices to the list
      if (listResult.isNotEmpty) {
        devicesList.value = listResult.map((device) {
          return BluetoothDeviceInfo(
            name: device.name,
            macAddress: device.macAdress,
          );
        }).toList();
      }

      // Add a delay of 3 seconds to simulate scanning
      await Future.delayed(const Duration(seconds: 3));

      isLoading.value = false; // Stop loading indicator

      // Show a notification based on the scan results
      if (devicesList.isEmpty) {
        Get.closeAllSnackbars();
        Get.snackbar(
            "لم يتم العثور على أجهزة", "لم يتم العثور على أي جهاز بلوتوث.");
      } else {
        Get.closeAllSnackbars();
        Get.snackbar("تم العثور على أجهزة",
            "تم العثور على ${devicesList.length} أجهزة.");
      }
    } catch (e) {
      isLoading.value = false; // Stop loading indicator on error
      Get.closeAllSnackbars();
      Get.snackbar("خطا", "مشکلی در اسکن دستگاه‌های بلوتوث رخ داد: $e");
    }
  }

  // Connect to a specific Bluetooth device
  Future<void> connectToDevice(String remoteId, String advName) async {
    try {
      bool connectionStatus = await PrintBluetoothThermal.connectionStatus;
      if (!connectionStatus) {
        await PrintBluetoothThermal.connect(macPrinterAddress: remoteId);
      }
      Constants.localStorage.write('printAddres', {
        'macAddress': remoteId,
        'name': advName,
      });
      deviceName.value = advName;
      // connectedDevice.value = device;
      isConnected.value = true;
      Get.closeAllSnackbars();
      Get.snackbar("تم الاتصال", "تم الاتصال بـ $advName بنجاح.");
    } catch (e) {
      Get.closeAllSnackbars();
      Get.snackbar("خطأ", "فشل الاتصال بـ $advName: $e");
    }
  }

  // Disconnect from the current Bluetooth device
  Future<void> disconnectDevice() async {
    Constants.localStorage.remove('printAddres');
    Get.closeAllSnackbars();
    Get.snackbar("تم قطع الاتصال", "تم قطع الاتصال مع الجهاز.");
    isConnected.value = false;
  }
}

class BluetoothDeviceInfo {
  final String name;
  final String macAddress;

  BluetoothDeviceInfo({
    required this.name,
    required this.macAddress,
  });

  // متدی برای تبدیل به BluetoothDevice
  BluetoothDevice toBluetoothDevice() {
    return BluetoothDevice(
      remoteId: DeviceIdentifier(macAddress),
    );
  }
}
