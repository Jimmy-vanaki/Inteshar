import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:Inteshar/app/config/constants.dart';
import 'package:Inteshar/app/features/home/view/getX/purchase_methods_controller.dart';
import 'package:Inteshar/app/features/purchase_methods/view/screens/purchase_methods_item.dart';

class USerReportingList extends StatelessWidget {
  const USerReportingList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height - 310,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 90, top: 0, left: 20, right: 20),
        itemCount: 15,
        itemBuilder: (context, index) {
          PurchaseMethodsController purchaseMethodsController =
              Get.put(PurchaseMethodsController(), tag: index.toString());
          return InkWell(
            onTap: () {
              purchaseMethodsController.purchaseMethodsSelected.value = -1;
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(bottom: 10),
              decoration: Constants.intesharBoxDecoration(context).copyWith(
                color: Theme.of(context).colorScheme.primary.withAlpha(30),
                boxShadow: [],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        BoardDateFormat('yyyy/MM/dd').format(DateTime.now()),
                      ),
                      Text(
                        'ASIACELL 500',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                  const Gap(10),
                  Text('Pin Code : 984763519991'),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          BoardDateFormat('yyyy/MM/dd').format(DateTime.now())),
                      Text('095326854752'),
                    ],
                  ),
                  const Gap(10),
                  SizedBox(
                    width: double.infinity,
                    child: PurchaseMethodsItem(
                      scale: 40,
                      tag: index.toString(),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
