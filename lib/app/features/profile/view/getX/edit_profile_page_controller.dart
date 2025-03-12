import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inteshar/app/features/home/data/data_source/home_api_provider.dart';

class EditProfilePageController extends GetxController {
  final updateController = Get.find<HomeApiProvider>();
  final RxBool isPasswordHidden = true.obs;
  final RxBool isPasswordHiddenConfirm = true.obs;
  RxString networkImageUrl = ''.obs;
  var pickedImageFile = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();

  final addressController = TextEditingController();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    if (updateController.homeDataList.isNotEmpty) {
      final user = updateController.homeDataList.first;
      networkImageUrl.value = user.user?.photoUrl ?? '';
    } else {
      networkImageUrl = ''.obs;
    }
  }

  @override
  void onClose() {
    addressController.dispose();
    mobileController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    super.onClose();
  }

  // Method to pick image from gallery
  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      pickedImageFile.value = File(pickedFile.path); // Update the picked image
    }
  }

  // Method to reset to network image
  void resetToNetworkImage() {
    pickedImageFile.value = null;
  }

  // متد تبدیل تصویر به Base64
  String? convertImageToBase64() {
    final imageFile = pickedImageFile.value;
    if (imageFile != null) {
      final bytes = imageFile.readAsBytesSync();
      return base64Encode(bytes);
    }
    return null;
  }
}
