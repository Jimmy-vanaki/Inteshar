import 'package:flutter/material.dart';
import 'package:Inteshar/app/config/constants.dart';
import 'package:Inteshar/app/core/common/widgets/internal_page.dart';
import 'package:Inteshar/app/features/home/view/widgets/product_list.dart';

class ProductArchivePage extends StatelessWidget {
  const ProductArchivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return InternalPage(
        customWidget: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          decoration: Constants.intesharBoxDecoration(context),
          child: const ProductsList(),
        ),
        title: 'Test');
  }
}
