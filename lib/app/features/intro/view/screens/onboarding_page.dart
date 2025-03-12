import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inteshar/app/config/constants.dart';
import 'package:inteshar/app/core/routes/routes.dart';
import 'package:inteshar/app/features/intro/view/getX/onboarding_controller.dart';
import 'package:inteshar/app/features/intro/view/widgets/onborading_item.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    OnboardingController onBoardingController = Get.put(OnboardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: onBoardingController.pageController,
            onPageChanged: onBoardingController.animatedToPage,
            children: const [
              OnBoradingItem(
                image: 'cn-1',
                title: 'تنوع',
                description: 'آلاف نقاط البيع من جميع انحاء العراق!',
              ),
              OnBoradingItem(
                image: 'cn-2',
                title: 'الاداء والسرعة',
                description:
                    'أداء ثابت وسرعة في عرض النتائج والبيانات، يتيح الحصول على نتائج بفترة قياسية.',
              ),
              OnBoradingItem(
                image: 'cn-3',
                title: 'سهولة الاستخدام',
                description:
                    'واجهة سهلة الاستخدام مع خدمات مميزة لطريقة العرض والتنقل بين الخدمات.',
              ),
            ],
          ),
          Container(
            alignment: const Alignment(-0.78, -0.83),
            child: ZoomTapAnimation(
              onTap: () {
                onBoardingController.goToPage(2);
              },
              child: const Text(
                'تخطي',
              ),
            ),
          ),
          Obx(
            () => Container(
              alignment: const Alignment(0, 0.85),
              child: onBoardingController.page.value != 2
                  ? SmoothPageIndicator(
                      controller: onBoardingController.pageController,
                      count: 3,
                      effect: ExpandingDotsEffect(
                        spacing: 8,
                        radius: 10,
                        dotHeight: 8,
                        dotWidth: 8,
                        activeDotColor: Theme.of(context).colorScheme.secondary,
                        dotColor: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withAlpha(100),
                      ),
                    )
                  : Container(
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      width: (double.infinity),
                      child: ElevatedButton(
                        onPressed: () {
                          Get.offAllNamed(Routes.home);
                          Constants.localStorage
                              .write('hasSeenOnboarding', true);
                        },
                        child: const Text('ابدأ'),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
