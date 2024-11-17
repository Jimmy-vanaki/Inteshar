import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Inteshar/app/config/constants.dart';
import 'package:Inteshar/app/core/routes/routes.dart';
import 'package:Inteshar/app/features/intro/view/getX/onboarding_controller.dart';
import 'package:Inteshar/app/features/intro/view/widgets/onborading_item.dart';
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
                image: 'modern_design',
                title: 'دعم فني متواصل',
                description:
                    'دعم فني متواصل على مدار الساعة، نضمن تواجدنا لمساعدتك في أي وقت تحتاج فيه إلى الدعم.',
              ),
              OnBoradingItem(
                image: 'performance_overview',
                title: 'تغطية لمعظم المحافظات العراقية',
                description:
                    'ننشط في اغلب المحافظات العراقية، نتميز بطاقم اداري متخصص وذو خبرة واسعة في هذا المجال.',
              ),
              OnBoradingItem(
                image: 'my_notifications',
                title: 'تنوع في عرض البطاقات والكروت',
                description:
                    'نظام متكامل لبيع وتسويق البطاقات الالكترونية المحلية والعالمية متخصصة في مجال بطاقات تعبئة الأرصدة لمختلف الشركات المحلية و العالمية.',
              ),
            ],
          ),
          Container(
            alignment: const Alignment(-0.78, -0.83),
            child: ZoomTapAnimation(
              onTap: () {
                onBoardingController.goToPage(2);
              },
              child: Text('يتخطى'),
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
                        activeDotColor: Theme.of(context).colorScheme.primary,
                        dotColor: Theme.of(context)
                            .colorScheme
                            .primary
                            .withAlpha(100),
                      ),
                    )
                  : Container(
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      width: (double.infinity),
                      child: ElevatedButton(
                        onPressed: () {
                          Get.offAllNamed(Routes.welcomePage);
                          Constants.localStorage.write('hasSeenOnboarding', true);
                        },
                        child: Text('ابدأ'),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
