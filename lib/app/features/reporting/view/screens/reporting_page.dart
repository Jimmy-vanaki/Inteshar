import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:Inteshar/app/config/constants.dart';
import 'package:Inteshar/app/features/reporting/view/widgets/category_dropdown.dart';
import 'package:Inteshar/app/features/reporting/view/widgets/date.dart';
import 'package:Inteshar/app/features/reporting/view/widgets/user_reporting_list.dart';

class ReportingPage extends StatelessWidget {
  const ReportingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0, -1, 0),
      width: Get.width,
      height: Get.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(10),
            Container(
              alignment: Alignment.center,
              height: 220,
              width: Get.width - 40,
              padding: const EdgeInsets.all(20),
              decoration: Constants.intesharBoxDecoration(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ReportingDate(),
                  const Gap(20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CategoryDropdown(
                        itemList: [
                          DropdownMenuEntry(value: 'الکل', label: 'الکل'),
                          DropdownMenuEntry(
                              value: 'mohammad', label: 'mohammad'),
                          DropdownMenuEntry(value: 'ali', label: 'ali'),
                          DropdownMenuEntry(value: 'mohsen', label: 'mohsen'),
                          DropdownMenuEntry(value: 'abol', label: 'abol'),
                        ],
                      ),
                      Gap(10),
                      CategoryDropdown(
                        itemList: [
                          DropdownMenuEntry(value: '1000', label: '1000'),
                          DropdownMenuEntry(value: '2000', label: '2000'),
                          DropdownMenuEntry(value: '3000', label: '3000'),
                          DropdownMenuEntry(value: '4000', label: '4000'),
                        ],
                      ),
                    ],
                  ),
                  const Gap(10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/svgs/paper-plane-top.svg',
                          width: 20,
                          height: 20,
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.onPrimary,
                            BlendMode.srcIn,
                          ),
                        ),
                        const Gap(10),
                        Text(
                          'ارسال',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Gap(10),
            const USerReportingList(),
          ],
        ),
      ),
    );
  }
}
