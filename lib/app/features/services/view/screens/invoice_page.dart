import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:Inteshar/app/config/constants.dart';
import 'package:Inteshar/app/core/common/widgets/internal_page.dart';
import 'package:Inteshar/app/features/services/view/getX/invoice_controller.dart';
import 'package:Inteshar/app/features/services/view/widgets/invoice_modal_confirm.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class InvoicePage extends StatelessWidget {
  const InvoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    InvoiceController invoiceController = Get.put(InvoiceController());

    final List shortcutList = [
      {
        "price": '5,000',
        "onTap": () {
          invoiceController.goToItem(0);
        },
      },
      {
        "price": '10,000',
        "onTap": () {
          invoiceController.goToItem(1);
        },
      },
      {
        "price": '15,000',
        "onTap": () {
          invoiceController.goToItem(2);
        },
      },
      {
        "price": '20,000',
        "onTap": () {},
      },
    ];

    return InternalPage(
      title: 'فاتورة',
      customWidget: SingleChildScrollView(
        child: Container(
          height: 650,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          decoration: Constants.intesharBoxDecoration(context),
          child: Column(
            children: [
              const Gap(20),
              const Text(
                'للشراء من الفئة المطلوبة',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              const Gap(5),
              const Text(
                'يرجى ادخال رقم الهاتف وتحديد أو اختيار المبلغ المطلوب',
                style: TextStyle(fontSize: 11),
                textAlign: TextAlign.center,
              ),
              const Gap(60),
              TextFormField(
                textInputAction: TextInputAction.next,
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
              const Gap(30),
              AutoHeightGridView(
                itemCount: 3,
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 2),
                shrinkWrap: true,
                builder: (context, index) {
                  return ZoomTapAnimation(
                    onTap: shortcutList[index]['onTap'],
                    child: Obx(
                      () => Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.symmetric(vertical: 2),
                        decoration:
                            Constants.intesharBoxDecoration(context).copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                          border: Border(
                            right: BorderSide(
                              color: invoiceController.selected.value == index
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withAlpha(80),
                              width: 8,
                            ),
                          ),
                        ),
                        height: 60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              shortcutList[index]['price'],
                              style: TextStyle(
                                fontSize: 12,
                                color: invoiceController.selected.value == index
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withAlpha(80),
                              ),
                            ),
                            Text(
                              'IQD',
                              style: TextStyle(
                                fontSize: 12,
                                color: invoiceController.selected.value == index
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withAlpha(80),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              const Gap(30),
              const Text(
                'المبلغ بالدينار',
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
              Row(
                children: [
                  ZoomTapAnimation(
                    onTap: () {
                      if (invoiceController.selected.value > 0) {
                        invoiceController.selected.value--;
                        invoiceController
                            .animatedToItem(invoiceController.selected.value);
                      }
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: Constants.intesharBoxDecoration(context),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/svgs/angle-right.svg',
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.primary,
                            BlendMode.srcIn,
                          ),
                          width: 18,
                          height: 18,
                        ),
                      ),
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 2, vertical: 4),
                      child: Center(
                        child: SizedBox(
                          height: 70,
                          child: RotatedBox(
                            quarterTurns: 1,
                            child: ListWheelScrollView.useDelegate(
                              controller:
                                  invoiceController.fixedExtentScrollController,
                              physics: const FixedExtentScrollPhysics(),
                              itemExtent: 90,
                              diameterRatio: 2.0,
                              perspective: 0.003,
                              onSelectedItemChanged: (index) {
                                invoiceController.selected.value = index;
                              },
                              childDelegate: ListWheelChildBuilderDelegate(
                                builder: (context, index) {
                                  return Obx(
                                    () => RotatedBox(
                                      quarterTurns: 3,
                                      child: Container(
                                        width: 70,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: index ==
                                                  invoiceController
                                                      .selected.value
                                              ? Theme.of(context)
                                                  .colorScheme
                                                  .primary
                                              : Theme.of(context)
                                                  .colorScheme
                                                  .primary
                                                  .withAlpha(70),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Text(
                                          shortcutList[index]['price'],
                                          style: TextStyle(
                                            fontSize: index ==
                                                    invoiceController
                                                        .selected.value
                                                ? 24
                                                : 20,
                                            fontWeight: index ==
                                                    invoiceController
                                                        .selected.value
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                            color: index ==
                                                    invoiceController
                                                        .selected.value
                                                ? Theme.of(context)
                                                    .colorScheme
                                                    .onPrimary
                                                : Theme.of(context)
                                                    .colorScheme
                                                    .onPrimary
                                                    .withAlpha(200),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                childCount: shortcutList.length,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Gap(10),
                  ZoomTapAnimation(
                    onTap: () {
                      if (invoiceController.selected.value <
                          shortcutList.length - 1) {
                        invoiceController.selected.value++;
                        invoiceController
                            .animatedToItem(invoiceController.selected.value);
                      }
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: Constants.intesharBoxDecoration(context),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/svgs/angle-left.svg',
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.primary,
                            BlendMode.srcIn,
                          ),
                          width: 18,
                          height: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(10),
              const Text(
                'بامكانك الشراء في كل مرة من 1000 الى 100.000 دينار',
                style: TextStyle(fontSize: 10),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    invoiceModalConfirm(context);
                  },
                  child: const Text('التالي'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
