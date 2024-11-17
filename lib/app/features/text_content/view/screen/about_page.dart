import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.primary, BlendMode.srcIn),
            child: Image.asset(
              'assets/images/logo-01.png',
              width: 90,
              height: 80,
            ),
          ),
          const Gap(20),
          Text(
            '''
  شركة متخصصة في مجال أنظمة بيع وتوزيع البطاقات الرقمية والخدمات الالكترونية، تتميز بطاقم اداري متخصص وذو خبرة واسعة في هذا المجال لتصبح بذلك واحدة من أفضل الشركات في المنطقة.
شركة متخصصة في مجال أنظمة بيع وتوزيع البطاقات الرقمية والخدمات الالكترونية، تتميز بطاقم اداري متخصص وذو خبرة واسعة في هذا المجال لتصبح بذلك واحدة من أفضل الشركات في المنطقة.
''',
textAlign: TextAlign.justify,
          style: TextStyle(
            height: 2.5,
          ),
          )
        ],
      ),
    );
  }
}
