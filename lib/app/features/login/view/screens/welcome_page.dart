import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Inteshar/app/features/login/view/getX/welcome_controller.dart';
import 'package:Inteshar/app/features/login/view/widgets/forgot_password.dart';
import 'package:Inteshar/app/features/login/view/widgets/signin.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final WelcomeController welcomeController = Get.put(WelcomeController());
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Obx(() => SizedBox(
                width: Get.width - 80,
                height: Get.height,
                child: welcomeController.loginPage.value
                    ? const Signin()
                    : const ForgotPassword(),
              )),
        ),
      ),
    );
  }
}
