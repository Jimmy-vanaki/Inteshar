import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:Inteshar/app/config/constants.dart';
import 'package:Inteshar/app/core/utils/custom_loading.dart';
import 'package:Inteshar/app/features/home/view/getX/purchase_methods_controller.dart';
import 'package:Inteshar/app/features/purchase_methods/view/screens/purchase_methods_item.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    PurchaseMethodsController purchaseMethodsController =
        Get.put(PurchaseMethodsController(), tag: '');
    return AutoHeightGridView(
      itemCount: 10,
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 2),
      shrinkWrap: true,
      builder: (context, index) {
        return ZoomTapAnimation(
          onTap: () {
            print('erer');
            showModalBottomSheet(
              isScrollControlled: true,
              showDragHandle: true,
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              context: context,
              builder: (context) {
                return Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  alignment: Alignment.topCenter,
                  height: Get.height * .7,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 160,
                          clipBehavior: Clip.antiAlias,
                          decoration: Constants.intesharBoxDecoration(context),
                          child: Center(
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              height: 160,
                              width: double.infinity,
                              imageUrl:
                                  "https://images.unsplash.com/ephoto-1728943492981-be3e94e4d551?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%)3D",
                              placeholder: (context, url) =>
                                  const CustomLoading(),
                              errorWidget: (context, url, error) => Image.asset(
                                'assets/images/not.jpg',
                                fit: BoxFit.fill,
                                height: 160,
                                width: double.infinity,
                              ),
                            ),
                          ),
                        ),
                        const Gap(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'الشركة: ',
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          fontSize: 15,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'DIjlah IT',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Gap(10),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'السعر: ',
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          fontSize: 15,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '12333',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'العدد:',
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.primary,
                                    fontSize: 15,
                                  ),
                                ),
                                const Gap(10),
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    border: Border.symmetric(
                                      vertical: BorderSide(
                                        width: 1,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary
                                            .withAlpha(50),
                                      ),
                                    ),
                                  ),
                                  width: 45,
                                  height: 80,
                                  child: ListWheelScrollView.useDelegate(
                                    controller: purchaseMethodsController
                                        .fixedExtentScrollController,
                                    physics: const FixedExtentScrollPhysics(),
                                    itemExtent: 35,
                                    diameterRatio: 2.0,
                                    perspective: 0.003,
                                    onSelectedItemChanged: (index) {
                                      purchaseMethodsController.selected.value =
                                          index;
                                    },
                                    childDelegate: ListWheelChildBuilderDelegate(
                                      builder: (context, index) {
                                        return Obx(
                                          () => Container(
                                            width: 35,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: index ==
                                                      purchaseMethodsController
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
                                              (index + 1).toString(),
                                              style: TextStyle(
                                                fontSize: index ==
                                                        purchaseMethodsController
                                                            .selected.value
                                                    ? 24
                                                    : 20,
                                                fontWeight: index ==
                                                        purchaseMethodsController
                                                            .selected.value
                                                    ? FontWeight.bold
                                                    : FontWeight.normal,
                                                color: index ==
                                                        purchaseMethodsController
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
                                        );
                                      },
                                      childCount: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Gap(20),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text('الاجراء: '),
                        ),
                        const Gap(10),
                        const PurchaseMethodsItem(
                          scale: 50,
                          tag: 'single',
                        ),
                       
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Container(
            height: 120,
            clipBehavior: Clip.antiAlias,
            decoration: Constants.intesharBoxDecoration(context),
            child: Center(
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                height: 120,
                width: double.infinity,
                imageUrl:
                    "https://images.unsplash.com/ephoto-1728943492981-be3e94e4d551?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%)3D",
                placeholder: (context, url) => const CustomLoading(),
                errorWidget: (context, url, error) => Image.asset(
                  'assets/images/not.jpg',
                  fit: BoxFit.fill,
                  height: 120,
                  width: double.infinity,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
