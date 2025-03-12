import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PurchaseMethodsController extends GetxController {
  RxInt purchaseMethodsSelected = (-1).obs;
  FixedExtentScrollController fixedExtentScrollController =
      FixedExtentScrollController();
  RxInt counter = 0.obs;
  RxBool hasGlobalCard = false.obs;
  RxInt isButtonDisabled = 0.obs;
  List<Map<String, dynamic>> get purchaseMethodsList {
    return [
      {"message": 'طباعة', "icon": 'print', "type": 'print'},
      {"message": 'مشاركة', "icon": 'share-square', "type": 'share'},
      {"message": 'ارسال صورة', "icon": 'file-image', "type": 'sendImage'},
      {"message": 'نسخ', "icon": 'copy-alt', "type": 'copy'},
      // {"message": 'رسالة نصية', "icon": 'comment-sms', "type": 'sms'}
    ];
  }

  @override
  void onInit() {
    fixedExtentScrollController =
        FixedExtentScrollController(initialItem: counter.value);
    fixedExtentScrollController.jumpToItem(
      counter.value,
    );
    super.onInit();
  }

  selectMethod({required int index}) {
    purchaseMethodsSelected.value = index;
  }

  @override
  void onClose() {
    fixedExtentScrollController.dispose();
    super.onClose();
  }
}
