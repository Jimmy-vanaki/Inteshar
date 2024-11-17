import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';
import 'package:Inteshar/app/config/constants.dart';
import 'package:Inteshar/app/core/common/widgets/internal_page.dart';
import 'package:Inteshar/app/core/utils/custom_loading.dart';
import 'package:Inteshar/app/features/purchase_methods/view/getX/print_controller.dart';
import 'package:Inteshar/app/features/purchase_methods/view/widgets/build_print_widget.dart';

class BluetoothPage extends StatelessWidget {
  BluetoothPage({super.key});
  final GlobalKey _globalKey = GlobalKey();
  final BluetoothController bluetoothController =
      Get.put(BluetoothController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return InternalPage(
        customWidget: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          decoration: Constants.intesharBoxDecoration(context),
          child: Obx(
            () => SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: bluetoothController.isConnected.value
                  ? Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: RepaintBoundary(
                              key: _globalKey,
                              child: Column(
                                children: List.generate(
                                  2,
                                  (index) => Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.only(bottom: 25),
                                    child: const PrintWidget(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Gap(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () async {
                                _captureAndSavePng();
                              },
                              label: const Text('طباعة'),
                              icon: SvgPicture.asset(
                                'assets/svgs/print.svg',
                                colorFilter: ColorFilter.mode(
                                  Theme.of(context).colorScheme.onPrimary,
                                  BlendMode.srcIn,
                                ),
                                width: 20,
                                height: 20,
                              ),
                            ),
                            const Gap(10),
                            ElevatedButton.icon(
                              onPressed: () {
                                bluetoothController.disconnectDevice();
                              },
                              label: Text('قطع الاتصال'),
                              icon: SvgPicture.asset(
                                'assets/svgs/signal-stream-slash.svg',
                                colorFilter: ColorFilter.mode(
                                  Theme.of(context).colorScheme.onPrimary,
                                  BlendMode.srcIn,
                                ),
                                width: 20,
                                height: 20,
                              ),
                            ),
                          ],
                        ),
                        const Gap(5),
                        Text(
                            "تم الاتصال بـ : ${bluetoothController.connectedDevice.value?.advName}"),
                      ],
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            
                            itemCount: bluetoothController.devicesList.length,
                            itemBuilder: (context, index) {
                              final device =
                                  bluetoothController.devicesList[index];
                              return Directionality(
                                textDirection: TextDirection.ltr,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withAlpha(30),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  margin: const EdgeInsets.only(bottom: 10),
                                  child: ListTile(
                                    title: Text(device.advName),
                                    subtitle: Text(device.remoteId.toString()),
                                    onTap: () {
                                      bluetoothController
                                          .connectToDevice(device);
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              bluetoothController.checkAndRequestBluetooth();
                            },
                            child: bluetoothController.isLoading.value
                                ? CustomLoading(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  )
                                : Text('البحث عن أجهزة'),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
        title: 'طباعة');
  }

  Future<void> _captureAndSavePng() async {
    try {
      // گرفتن اسکرین‌شات از ویجت
      RenderRepaintBoundary boundary = _globalKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData != null) {
        Uint8List pngBytes = byteData.buffer.asUint8List();
        bluetoothController.captureAndPrint(pngBytes);
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
