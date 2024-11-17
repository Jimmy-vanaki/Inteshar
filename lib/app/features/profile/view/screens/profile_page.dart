import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:Inteshar/app/core/common/widgets/internal_page.dart';
import 'package:Inteshar/app/core/routes/routes.dart';
import 'package:Inteshar/app/core/utils/custom_loading.dart';
import 'package:Inteshar/app/features/profile/view/widgets/user_information.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return InternalPage(
      title: 'الملف الشخصي',
      customWidget: Stack(
        alignment: Alignment.center,
        children: [
          //Avatar
          Positioned(
            top: 30,
            child: Column(
              children: [
                Text(
                  'Mohammad',
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Gap(10),
                Container(
                  width: 170,
                  height: 170,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.onPrimary,
                      width: 5,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(80.0),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      height: 160,
                      width: 160,
                      imageUrl:
                          "https://images.unsplash.com/photo-1728943492981-be3e94e4d551?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%)3D",
                      placeholder: (context, url) => const CustomLoading(),
                      errorWidget: (context, url, error) => Image.asset(
                        'assets/images/not.jpg',
                        fit: BoxFit.fill,
                        height: 160,
                        width: 160,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Data
          Positioned(
            top: 240,
            width: Get.width,
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: USerInformationWidget(),
            ),
          ),
          // Edit Button
          Positioned(
            top: 190,
            right: 120,
            child: Container(
              width: 40,
              height: 40,
              padding:
                  const EdgeInsets.only(left: 9, bottom: 8, top: 5, right: 5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              child: ZoomTapAnimation(
                onTap: () {
                  Get.toNamed(Routes.editProfilePage);
                },
                child: SvgPicture.asset(
                  'assets/svgs/user-pen.svg',
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
