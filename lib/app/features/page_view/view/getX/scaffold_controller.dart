import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';

class ScaffoldController extends GetxController {
  var sliderDrawerKey = GlobalKey<SliderDrawerState>();

  RxBool drawerOpen = false.obs;
  void openDrawer() {
    Future.delayed(
      const Duration(milliseconds: 0),
      () => drawerOpen.value = true,
    );

    sliderDrawerKey.currentState?.openSlider();
  }

  void closeDrawer() {
    drawerOpen.value = false;
    sliderDrawerKey.currentState?.closeSlider();
  }
}
