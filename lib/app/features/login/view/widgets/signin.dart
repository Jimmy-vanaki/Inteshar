import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:Inteshar/app/core/routes/routes.dart';
import 'package:Inteshar/app/features/login/view/getX/welcome_controller.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class Signin extends StatelessWidget {
  const Signin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // FocusNode fildOne = FocusNode();
    FocusNode fildTwo = FocusNode();
    final WelcomeController welcomeController = Get.put(WelcomeController());
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'مرحبًا بعودتك',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 25,
            ),
          ),
          const Gap(40),
          SvgPicture.asset(
            width: Get.width - 120,
            height: Get.height * 0.4,
            'assets/svgs/welcome/sign_in.svg',
          ),
          const Gap(40),
          Form(
            child: Column(
              children: [
                TextFormField(
                  // focusNode: fildOne,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (GetUtils.isEmail(value!)) {
                      return null;
                    }
                    return 'أدخل بريد إلكتروني صالح';
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onFieldSubmitted: (v) {
                    FocusScope.of(context).requestFocus(fildTwo);
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text(
                      'البريد الإلكتروني',
                    ),
                  ),
                ),
                const Gap(20),
                Obx(
                  () => TextFormField(
                    focusNode: fildTwo,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: welcomeController.isPasswordHidden.value,
                    validator: (value) {
                      if (value!.length > 7) {
                        return null;
                      }
                      return 'أدخل كلمة المرور الخاصة بك بشكل صحيح';
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        width: 1,
                      )),
                      label: Text(
                        'كلمة المرور',
                      ),
                      suffix: ZoomTapAnimation(
                        onTap: () {
                          welcomeController.isPasswordHidden.value =
                              !welcomeController.isPasswordHidden.value;
                        },
                        child: SvgPicture.asset(
                          welcomeController.isPasswordHidden.value
                              ? 'assets/svgs/eye.svg'
                              : 'assets/svgs/eye-crossed.svg',
                          width: 20,
                          height: 20,
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.primary,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Gap(20),
                ElevatedButton(
                  // focusNode: focus,
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    Get.offNamed(Routes.home);
                    debugPrint('=======>statement');
                  },
                  child: const Text('دخول'),
                ),
              ],
            ),
          ),
          const Gap(10),
          TextButton(
            onPressed: () {
              print('object');
              welcomeController.loginPage.value =
                  !welcomeController.loginPage.value;
            },
            child: const Text(
              'نسيت كلمة المرور',
              style: TextStyle(
                fontSize: 12,
              ),
              textDirection: TextDirection.rtl,
            ),
          ),
        ],
      ),
    );
  }
}
