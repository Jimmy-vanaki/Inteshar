import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class InvoiceController extends GetxController {
  FixedExtentScrollController fixedExtentScrollController =
      FixedExtentScrollController();
  RxInt selected = 0.obs;
  final TextEditingController phoneController = TextEditingController(text: '');

  @override
  void onInit() {
    fixedExtentScrollController =
        FixedExtentScrollController(initialItem: selected.value);
    super.onInit();
  }

  @override
  void onClose() {
    fixedExtentScrollController.dispose();
    super.onClose();
  }

  goToItem(int index) {
    selected.value = index;
    fixedExtentScrollController.jumpToItem(
      index,
    );
  }

  animatedToItem(int index) {
    selected.value = index;
    fixedExtentScrollController.animateToItem(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeIn,
    );
  }
}
