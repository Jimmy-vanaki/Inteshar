import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:inteshar/app/core/routes/routes.dart';
import 'package:inteshar/app/features/page_view/view/getX/scaffold_controller.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

AppBar customAppBar(BuildContext context , ScaffoldController controller) {
  return AppBar(
    elevation: 0,
    backgroundColor: Theme.of(context).colorScheme.primary,
    leading: IconButton(
      icon: SvgPicture.asset(
        'assets/svgs/bars-staggered.svg',
        colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.onPrimary,
          BlendMode.srcIn,
        ),
      ),
      onPressed: () {
        if (controller.drawerOpen.value) {
          controller.closeDrawer();
        } else {
          controller.openDrawer();
        }
      },
      tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(left: 20),
        child: ZoomTapAnimation(
          onTap: () {
            Get.toNamed(Routes.notifArchive);
          },
          child: SvgPicture.asset(
            'assets/svgs/bell.svg',
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.onPrimary,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    ],
  );
}
