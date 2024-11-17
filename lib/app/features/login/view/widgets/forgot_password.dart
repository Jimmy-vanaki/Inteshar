import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:Inteshar/app/features/login/view/getX/welcome_controller.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final WelcomeController welcomeController = Get.put(WelcomeController());
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 50,
            right: 0,
            child: ZoomTapAnimation(
              onTap: () {
                welcomeController.loginPage.value = !welcomeController.loginPage.value;
              },
              child: SvgPicture.asset(
                'assets/svgs/arrow-small-right.svg',
                width: 40,
                height: 40,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.primary,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'استعادة كلمة المرور',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                ),
              ),
              const Gap(40),
              SvgPicture.asset(
                width: Get.width - 120,
                'assets/svgs/welcome/forgot_password.svg',
              ),
              const Gap(40),
              Form(
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
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text(
                          'البريد الإلكتروني',
                        ),
                      ),
                    ),
                    const Gap(20),
                    ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                       
                      },
                      child: const Text('ارسال'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
