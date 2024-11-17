import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:Inteshar/app/core/common/constants/get_version.dart';
import 'package:Inteshar/app/core/common/constants/launch_url.dart';
import 'package:Inteshar/app/core/routes/routes.dart';
import 'package:Inteshar/app/features/page_view/view/getX/navigation_controller.dart';
import 'package:Inteshar/app/features/text_content/view/screen/text_content.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.sliderDrawerKey,
  });
  final GlobalKey<SliderDrawerState> sliderDrawerKey;

  @override
  Widget build(BuildContext context) {
    final BottmNavigationController navigationController =
        Get.put(BottmNavigationController(), permanent: true);
    final AppVersionController appVersionController =
        Get.put(AppVersionController());
    final List<Map<String, dynamic>> drawerItemList = [
      {
        "title": 'الرئيسية',
        "icon": 'house',
        "onTap": () {
          sliderDrawerKey.currentState?.closeSlider();
          navigationController.goToPage(0);
        },
      },
      {
        "title": 'الملف الشخصي',
        "icon": 'user',
        "onTap": () {
          Get.toNamed(
            Routes.profilePage,
          );
        },
      },
      {
        "title": 'الاشعارات',
        "icon": 'bell',
        "onTap": () {
          Get.toNamed(
            Routes.notifArchive,
          );
        },
      },
      {
        "title": 'حول التطبيق',
        "icon": 'info',
        "onTap": () {
          sliderDrawerKey.currentState?.closeSlider();
          navigationController.goToPage(1);
        },
      },
      {
        "title": 'سياسية الخصوصية',
        "icon": 'confidential-discussion',
        "onTap": () {
          Get.toNamed(Routes.textContent,
              arguments:
                  const TextContent(title: 'سياسية الخصوصية', text: 'text'));
        },
      },
      {
        "title": 'الدعم الفني',
        "icon": 'user-headset',
        "onTap": () {
          Get.toNamed(Routes.textContent,
              arguments: const TextContent(title: 'الدعم الفني', text: 'text'));
        },
      },
      {
        "title": 'الشروط والقوانين',
        "icon": 'terms-info',
        "onTap": () {
          // sliderDrawerKey.currentState?.closeSlider();
          Get.toNamed(Routes.textContent,
              arguments:
                  const TextContent(title: 'الشروط والقوانين', text: 'text'));
        },
      },
      {
        "title": 'إعدادات',
        "icon": 'settings',
        "onTap": () {
          sliderDrawerKey.currentState?.closeSlider();
          navigationController.goToPage(2);
        },
      },
      {
        "title": 'خروج',
        "icon": 'sign-out-alt',
        "onTap": () {
          Get.dialog(
            AlertDialog(
              title: const Text('تنبيه'),
              content: const Text('هل تريد تسجيل الخروج من حسابك؟'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text(
                    'لا',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'نعم',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      },
    ];
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.zero),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'Mohammad',
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
            accountEmail: Text(
              'm.vanaki77@gmail.com',
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
            currentAccountPicture: ClipOval(
              child: Image.asset('assets/images/profile.png'),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: drawerItemList.length,
            itemBuilder: (context, index) {
              return index != 7
                  ? drawerItemWidget(
                      title: drawerItemList[index]['title'],
                      icon: drawerItemList[index]['icon'],
                      onTap: drawerItemList[index]['onTap'],
                      tag: index,
                      context: context,
                    )
                  : Column(
                      children: [
                        const Divider(),
                        drawerItemWidget(
                          title: drawerItemList[index]['title'],
                          icon: drawerItemList[index]['icon'],
                          onTap: drawerItemList[index]['onTap'],
                          tag: index,
                          context: context,
                        ),
                      ],
                    );
            },
          ),
          const Gap(10),
          Column(
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'الاصدار: ',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    TextSpan(
                      text: appVersionController.version.value,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(5),
              ZoomTapAnimation(
                onTap: () {
                  urlLauncher('https://dijlah.org');
                },
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Powered by ',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 13,
                        ),
                      ),
                      TextSpan(
                        text: 'DIjlah IT',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  ListTile drawerItemWidget({
    required String title,
    required String icon,
    required int tag,
    required Function() onTap,
    required BuildContext context,
  }) {
    return ListTile(
      leading: SvgPicture.asset(
        'assets/svgs/$icon.svg',
        colorFilter: ColorFilter.mode(
          tag != 8 ? Theme.of(context).colorScheme.primary : Colors.red,
          BlendMode.srcIn,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          color: tag != 8 ? Theme.of(context).colorScheme.primary : Colors.red,
        ),
      ),
      trailing: tag != 8
          ? SvgPicture.asset(
              'assets/svgs/angle-left.svg',
              width: 12,
              height: 12,
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.primary,
                BlendMode.srcIn,
              ),
            )
          : const SizedBox(),
      onTap: onTap,
    );
  }
}
