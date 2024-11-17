import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:Inteshar/app/core/common/constants/dashed_border.dart';
import 'package:Inteshar/app/features/home/view/getX/purchase_methods_controller.dart';
import 'package:Inteshar/app/features/purchase_methods/repositories/methods_manager.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class PurchaseMethodsItem extends StatelessWidget {
  const PurchaseMethodsItem({
    super.key,
    required this.scale,
    required this.tag,
  });
  final double scale;
  final String tag;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> purchaseMethodsList = [
      {"message": 'پرینت', "icon": 'print'},
      {"message": 'اشتراک', "icon": 'share-square'},
      {"message": 'عکس', "icon": 'file-image'},
      {"message": 'کپی', "icon": 'copy-alt'},
      {"message": 'شارژ مستقیم', "icon": 'sim-card'},
      {"message": 'sms', "icon": 'comment-sms'}
    ];
    PurchaseMethodsController purchaseMethodsController =
        Get.put(PurchaseMethodsController(), tag: tag);
    final singleController =
        Get.put(PurchaseMethodsController(), tag: 'single');
    return Column(
      children: [
        SizedBox(
          height: scale,
          width: double.infinity,
          child: Center(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: purchaseMethodsList.length,
              itemBuilder: (context, index) {
                return ZoomTapAnimation(
                  onTap: () {
                    print(index);
                    purchaseMethodsController.selectMethod(index: index);
                  },
                  child: Tooltip(
                    message: purchaseMethodsList[index]['message'],
                    child: Obx(
                      () => Container(
                        height: scale,
                        width: scale,
                        margin: const EdgeInsets.only(
                            left: 4, top: 1, bottom: 1, right: 1),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: purchaseMethodsController
                                          .purchaseMethodsSelected.value ==
                                      index
                                  ? Colors.grey.withOpacity(0.5)
                                  : Colors.transparent,
                              blurRadius: 2,
                              offset: const Offset(0, 0),
                            ),
                          ],
                          color: purchaseMethodsController
                                      .purchaseMethodsSelected.value ==
                                  index
                              ? Theme.of(context).colorScheme.primary
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SvgPicture.asset(
                          'assets/svgs/${purchaseMethodsList[index]['icon']}.svg',
                          colorFilter: ColorFilter.mode(
                            purchaseMethodsController
                                        .purchaseMethodsSelected.value ==
                                    index
                                ? Theme.of(context).colorScheme.onPrimary
                                : Theme.of(context).colorScheme.primary,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const Gap(20),
        Obx(() {
          return (singleController.purchaseMethodsSelected.value != -1)
              ? DashedBorder(
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    child: Center(child: Text('data')),
                  ),
                )
              : SizedBox();
        }),
        const Gap(20),
        Obx(
          () {
            return (purchaseMethodsController.purchaseMethodsSelected.value !=
                    -1)
                ? ElevatedButton(
                    onPressed: () {
                      print(purchaseMethodsController
                          .purchaseMethodsSelected.value);
                      manageMethods(
                          type: purchaseMethodsController
                              .purchaseMethodsSelected.value);
                    },
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
                        const Text(
                          'ارسال',
                        ),
                      ],
                    ),
                  )
                : const SizedBox();
          },
        ),
      ],
    );
  }
}
