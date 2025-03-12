import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inteshar/app/features/home/data/data_source/products_api_provider.dart';
import 'package:inteshar/app/features/home/data/models/home_model.dart';
import 'package:inteshar/app/features/home/view/getX/company_slider_controller.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CompanyListSlider extends StatelessWidget {
  const CompanyListSlider({
    super.key,
    required this.companyList,
  });
  final List<HomeModel> companyList;
  @override
  Widget build(BuildContext context) {
    final CompanySliderController companySliderController =
        Get.put(CompanySliderController());
    final ProductsApiProvider productsApiProvider =
        Get.find<ProductsApiProvider>(tag: 'random');

// Define a modifiable list of maps
    final List<Map<String, dynamic>> parsCompanyList = [
      {
        'title': 'الكل',
        'id': -1,
      },
    ];

// Iterate over the categories of the first company in companyList
    for (var i = 0; i < companyList.first.companyCategories.length; i++) {
      var category = companyList.first.companyCategories[i];

      parsCompanyList.add({
        'title': category.title, // Retrieve category title
        'id': category.id, // Retrieve category id
      });
    }

    return SizedBox(
      height: 50.0,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: min(parsCompanyList.length, 10),
        itemBuilder: (BuildContext context, int index) => ZoomTapAnimation(
          onTap: () {
            print(parsCompanyList[index]['id']);
            companySliderController.selected.value = index - 1;
            companySliderController.activeCompany.value =
                parsCompanyList[index]['id'];
            // companySliderController.currentCompany(
            //   index,
            // );
            // productsApiProvider.fetchProducts(parsCompanyList[index]['id']);
          },
          child: Obx(
            () => AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin:
                  const EdgeInsets.only(left: 10, top: 2, bottom: 2, right: 2),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: (index - 1) == companySliderController.selected.value
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.primary.withAlpha(40),
                border: Border.all(
                  color: (index - 1) == companySliderController.selected.value
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.surface,
                ),
                borderRadius: BorderRadius.circular(120),
                // border: Border.all(
                //   color: index == companySliderController.selected.value
                //       ? Colors.black
                //       : Theme.of(context).colorScheme.onPrimary,
                // ),
              ),
              child: Center(
                child: Text(
                  parsCompanyList[index]['title'],
                  style: TextStyle(
                    color: (index - 1) == companySliderController.selected.value
                        ? Colors.black
                        : Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                // child: CachedNetworkImage(
                //   fit: BoxFit.cover,
                //   width: index == companySliderController.selected.value
                //       ? 120
                //       : 80,
                //   height: 80,
                //   imageUrl: companyList.first.companies[index].logoUrl,
                //   placeholder: (context, url) => const CustomLoading(),
                //   errorWidget: (context, url, error) => Image.asset(
                //     'assets/images/not.jpg',
                //     fit: BoxFit.fill,
                //     width: index == companySliderController.selected.value
                //         ? 120
                //         : 80,
                //     height: 80,
                //   ),
                // ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
