import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:inteshar/app/config/constants.dart';
import 'package:inteshar/app/core/common/widgets/internal_page.dart';
import 'package:inteshar/app/core/routes/routes.dart';

class ResultPage extends StatelessWidget {
  final String phone;
  final String trackingCode;
  final String price;
  final String title;
  final String category;

  const ResultPage({
    super.key,
    required this.phone,
    required this.trackingCode,
    required this.price,
    required this.title,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return InternalPage(
      title: title,
      child: Container(
        width: double.infinity,
        height: 650,
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        decoration: Constants.intesharBoxDecoration(context),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/svgs/terms-check.svg',
                    colorFilter: const ColorFilter.mode(
                      Colors.green,
                      BlendMode.srcIn,
                    ),
                  ),
                  const Gap(6),
                  const Text(
                    'تمت التعبئة بنجاح',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const Gap(18),
              buildInfoRow('رقم التتبع :', trackingCode),
              buildInfoRow('رقم الهاتف :', phone),
              buildInfoRow('الفئة :', price),
              buildInfoRow('السعر :', category),
              const Spacer(),
              ElevatedButton(
                onPressed: () => Get.offNamed(Routes.home),
                child: const Text('رجوع'),
              ),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8),

          Expanded(
            child: Text(
              textAlign: TextAlign.left,
              value,
              softWrap: true,
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }
}
