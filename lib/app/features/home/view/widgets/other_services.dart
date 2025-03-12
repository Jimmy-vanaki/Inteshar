import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:inteshar/app/core/routes/routes.dart';
import 'package:inteshar/app/features/services/view/screens/invoice_page.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class OtherServices extends StatelessWidget {
  const OtherServices({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> otherServicesList = [
      {
        "title": 'TopUp',
        "icon": 'point-of-sale-bill',
        "onTap": () {
          Get.toNamed(Routes.invoicePage,
              arguments: const InvoicePage(type: 'topup', title: 'TOPUP'));
        },
      },
      {
        "title": 'فاتورة',
        "icon": 'digital-payment',
        "onTap": () {
          // Get.toNamed(Routes.invoicePage,
          //     arguments: const InvoicePage(type: 'bill', title: 'فاتورة'));

          Get.snackbar('تنبيه', 'الخدمة المطلوبة غير مفعلة حاليا');
        },
      },
      {
        "title": 'باقات',
        "icon": 'box-open',
        "onTap": () {
          Get.toNamed(Routes.internetPackagesPage);
        },
      },
    ];
    return AutoHeightGridView(
      itemCount: otherServicesList.length,
      crossAxisCount: 3,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 2),
      shrinkWrap: true,
      builder: (context, index) {
        return ZoomTapAnimation(
          onTap: otherServicesList[index]['onTap'],
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withAlpha(40),
              shape: BoxShape.circle,
              border: Border.all(
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
            height: 100,
            child: Column(
              children: [
                Expanded(
                  child: SvgPicture.asset(
                    'assets/svgs/${otherServicesList[index]['icon']}.svg',
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.onPrimary,
                      BlendMode.srcIn,
                    ),
                    width: 37,
                    height: 37,
                  ),
                ),
                Text(
                  otherServicesList[index]['title'],
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
