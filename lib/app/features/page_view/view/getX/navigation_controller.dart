import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottmNavigationController extends GetxController {
  PageController pageController = PageController();

  // Variable for changing index of Bottom Appbar
  RxInt currentPage = 0.obs;

  void goToPage(int page) {
    currentPage.value = page;
    pageController.jumpToPage(page);
  }

  void animatedToPage(int page) {
    currentPage.value = page;
    pageController.animateToPage(currentPage.value,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: currentPage.value);
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
