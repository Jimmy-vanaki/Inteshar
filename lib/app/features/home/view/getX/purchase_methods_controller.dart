import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PurchaseMethodsController extends GetxController {
  RxInt purchaseMethodsSelected = (-1).obs;

  selectMethod({required int index}) {
    purchaseMethodsSelected.value = index;
  }

  FixedExtentScrollController fixedExtentScrollController =
      FixedExtentScrollController();
  RxInt selected = 0.obs;

  @override
  void onInit() {
    fixedExtentScrollController =
        FixedExtentScrollController(initialItem: selected.value);
    fixedExtentScrollController.jumpToItem(
      selected.value,
    );
    super.onInit();
  }

  @override
  void onClose() {
    fixedExtentScrollController.dispose();
    super.onClose();
  }
}
