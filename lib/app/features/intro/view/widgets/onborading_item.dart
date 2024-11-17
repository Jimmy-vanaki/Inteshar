import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:delayed_widget/delayed_widget.dart';

class OnBoradingItem extends StatelessWidget {
  const OnBoradingItem({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });
  final String image;
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      padding: const EdgeInsets.all(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DelayedWidget(
            delayDuration: const Duration(milliseconds: 200),
            animationDuration: const Duration(seconds: 1),
            animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
            child: SvgPicture.asset(
              'assets/svgs/intro/$image.svg',
              height: Get.height * 0.4,
              width: Get.width * 0.5,
            ),
          ),
          DelayedWidget(
            delayDuration: const Duration(milliseconds: 400),
            animationDuration: const Duration(seconds: 1),
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Gap(20),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.primary.withAlpha(150),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
