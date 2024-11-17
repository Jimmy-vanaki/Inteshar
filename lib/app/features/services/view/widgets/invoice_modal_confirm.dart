import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:Inteshar/app/core/extensions/success_color_theme.dart';

Future<dynamic> invoiceModalConfirm(BuildContext context) {
  return showModalBottomSheet(
    isScrollControlled: true,
    showDragHandle: true,
    backgroundColor: Theme.of(context).colorScheme.onPrimary,
    context: context,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        alignment: Alignment.topCenter,
        height: Get.height * .3,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'رقم الهاتف :',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Text(
                  '09107722188',
                  style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          
            const Gap(25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('الفئة :'),
                Text(
                  '20,000 IQD',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const Gap(25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('السعر :'),
                Text(
                  'Monthly',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Theme.of(context)
                      .extension<SuccessColorTheme>()
                      ?.successColor),
                ),
                onPressed: () {},
                child: Text(
                  'تأكيد',
                  style: TextStyle(
                    color: Theme.of(context)
                        .extension<SuccessColorTheme>()
                        ?.onSuccessColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
