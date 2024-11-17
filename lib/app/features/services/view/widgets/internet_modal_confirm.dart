import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:Inteshar/app/core/extensions/success_color_theme.dart';

Future<dynamic> internetModalConfirm(BuildContext context) {
  return showModalBottomSheet(
    isScrollControlled: true,
    showDragHandle: true,
    backgroundColor: Theme.of(context).colorScheme.onPrimary,
    context: context,
    builder: (context) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          alignment: Alignment.topCenter,
          height: Get.height * .42,
          child: Column(
            children: [
              TextFormField(
                textDirection: TextDirection.ltr,
                validator: (value) {
                  if (value!.length < 12) {
                    return null;
                  }
                  return 'رقم الجوال غير صالح';
                },
                initialValue: ' ',
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  suffixText: '00964',
                  suffixStyle: TextStyle(
                      color:
                          Theme.of(context).colorScheme.primary.withAlpha(200)),
                  border: OutlineInputBorder(),
                  label: Text(
                    'رقم الهاتف',
                  ),
                ),
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('التصنيف :'),
                  Text(
                    'MAX Cards',
                    style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('الفئة :'),
                  Text(
                    '20,000 IQD',
                    style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('السعر :'),
                  Text(
                    'Monthly',
                    style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w700),
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
                    )),
              ),
            ],
          ),
        ),
      );
    },
  );
}
