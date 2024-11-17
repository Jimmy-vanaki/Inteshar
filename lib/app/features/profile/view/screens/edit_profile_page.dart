import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:Inteshar/app/core/common/widgets/internal_page.dart';
import 'package:Inteshar/app/core/utils/custom_loading.dart';
import 'package:Inteshar/app/features/profile/view/getX/edit_profile_page_controller.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ImageController imageController = Get.put(ImageController());
    final InputDecoration inputdecoration = InputDecoration(
      fillColor: Theme.of(context).colorScheme.primary.withAlpha(50),
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
      ),
    );
    return InternalPage(
      title: 'تعديل الملف الشخصي',
      customWidget: Stack(
        alignment: Alignment.center,
        children: [
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 240),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (GetUtils.isEmail(value!)) {
                            return null;
                          }
                          return 'أدخل بريد إلكتروني صالح';
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: inputdecoration.copyWith(
                          hintText: 'اسم',
                        ),
                      ),
                      const Gap(10),
                      TextFormField(
                        validator: (value) {
                          if (GetUtils.isEmail(value!)) {
                            return null;
                          }
                          return 'أدخل بريد إلكتروني صالح';
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: inputdecoration.copyWith(
                          hintText: 'العنوان',
                        ),
                      ),
                      const Gap(10),
                      TextFormField(
                        validator: (value) {
                          if (GetUtils.isEmail(value!)) {
                            return null;
                          }
                          return 'أدخل بريد إلكتروني صالح';
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: inputdecoration.copyWith(
                          hintText: 'الهاتف',
                        ),
                      ),
                      const Gap(10),
                      TextFormField(
                        validator: (value) {
                          if (value!.length > 7) {
                            return null;
                          }
                          return 'اشتباه';
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: inputdecoration.copyWith(
                          hintText: 'تغيير كلمة المرور',
                        ),
                      ),
                      const Gap(10),
                      TextFormField(
                        validator: (value) {
                          if (value!.length > 7) {
                            return null;
                          }
                          return 'اشتباه';
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: inputdecoration.copyWith(
                          hintText: 'تكرار كلمة المرور',
                        ),
                      ),
                      const Gap(20),
                      ElevatedButton(onPressed: () {}, child: Text('ارسال'))
                    ],
                  ),
                ),
              ),
            ),
          ),
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
                  child: Obx(
                    () => ClipRRect(
                      borderRadius: BorderRadius.circular(80.0),
                      child: imageController.pickedImageFile.value != null
                          ? Image.file(
                              imageController.pickedImageFile.value!,
                              width: 160,
                              height: 160,
                              fit: BoxFit.cover,
                            )
                          : CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: imageController.networkImageUrl.value,
                              placeholder: (context, url) =>
                                  const CustomLoading(),
                              errorWidget: (context, url, error) => Image.asset(
                                'assets/images/not.jpg',
                                fit: BoxFit.fill,
                                height: 160,
                                width: 160,
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Gallery
          Positioned(
            top: 190,
            right: 120,
            child: Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              child: ZoomTapAnimation(
                onTap: () => imageController.pickImage(),
                child: SvgPicture.asset(
                  'assets/svgs/folder-camera.svg',
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
