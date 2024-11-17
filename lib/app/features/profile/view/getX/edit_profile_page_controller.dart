import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  var networkImageUrl =
      "https://images.unsplash.com/photo-1728943492981-be3e94e4d551?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%253D%25"
          .obs;
  var pickedImageFile = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();

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
}
