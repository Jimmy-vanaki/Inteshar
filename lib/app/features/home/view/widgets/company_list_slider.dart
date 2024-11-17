import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Inteshar/app/config/constants.dart';
import 'package:Inteshar/app/core/utils/custom_loading.dart';
import 'package:Inteshar/app/features/home/view/getX/company_slider_controller.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CompanyListSlider extends StatelessWidget {
  const CompanyListSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final pageNumberController = Get.put(CompanySliderController());
    return SizedBox(
      height: 80.0,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) => ZoomTapAnimation(
          onTap: () {
            pageNumberController.currentCompany(index);
          },
          child: Obx(
            () => AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              width: index == pageNumberController.selected.value ? 110 : 80,
              height: 80,
              margin:
                  const EdgeInsets.only(left: 10, top: 2, bottom: 2, right: 2),
              clipBehavior: Clip.antiAlias,
              decoration: Constants.intesharBoxDecoration(context).copyWith(borderRadius: BorderRadius.circular(200)),
              child: Center(
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  width:
                      index == pageNumberController.selected.value ? 110 : 80,
                  height: 80,
                  imageUrl:
                      "https://images.unsplash.com/ephoto-1728943492981-be3e94e4d551?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%)3D",
                  placeholder: (context, url) => const CustomLoading(),
                  errorWidget: (context, url, error) => Image.asset(
                    'assets/images/not.jpg',
                    fit: BoxFit.fill,
                    width:
                        index == pageNumberController.selected.value ? 110 : 80,
                    height: 80,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
