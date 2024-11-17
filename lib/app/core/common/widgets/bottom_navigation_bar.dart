import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:Inteshar/app/features/page_view/view/getX/navigation_controller.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CostumBottomNavigationBar extends StatelessWidget {
  CostumBottomNavigationBar({
    super.key,
  });

  final BottmNavigationController navigationController =
      Get.put(BottmNavigationController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return BlurryContainer(
      blur: 5,
      width: Get.width - 80,
      height: 70,
      elevation: 0,
      color: Colors.white38,
      padding: const EdgeInsets.all(8),
      borderRadius: const BorderRadius.all(Radius.circular(50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _bottomAppBarItem(icon: 'house', page: 0, context: context),
          _bottomAppBarItem(icon: 'info', page: 1, context: context),
          _bottomAppBarItem(icon: 'settings', page: 2, context: context),
          _bottomAppBarItem(icon: 'stats', page: 3, context: context),
        ],
      ),
    );
  }

  Widget _bottomAppBarItem(
      {required String icon,
      required int page,
      required BuildContext context}) {
    return ZoomTapAnimation(
      onTap: () {
        navigationController.goToPage(page);
      },
      child: Obx(() => Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: navigationController.currentPage.value == page
                  ? Theme.of(context).colorScheme.primary
                  : Colors.transparent,
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/svgs/$icon.svg',
                colorFilter: ColorFilter.mode(
                  navigationController.currentPage.value == page
                      ? Theme.of(context).colorScheme.onPrimary
                      : Colors.black,
                  BlendMode.srcIn,
                ),
              ),
            ),
          )),
    );
  }
}
