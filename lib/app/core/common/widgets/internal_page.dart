import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class InternalPage extends StatelessWidget {
  const InternalPage({
    super.key,
    required this.customWidget,
    required this.title,
  });
  final Widget customWidget;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        titleSpacing: 0,
        title: Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            onPressed: () {
              print('object');
              Get.back();
            },
            icon: SvgPicture.asset(
              'assets/svgs/angle-left.svg',
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.onPrimary,
                BlendMode.srcIn,
              ),
              width: 20,
              height: 20,
            ),
          ),
        ),
        leading: const SizedBox(),
        flexibleSpace: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 20, top: 25),
            child: Text(
              title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 17,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        transform: Matrix4.translationValues(0, -1, 0),
        color: Theme.of(context).colorScheme.surface,
        width: Get.width,
        height: Get.height,
        child: Stack(
          children: [
            //Background
            Container(
              height: 150,
              width: Get.width,
              padding: const EdgeInsets.all(20),
              color: Theme.of(context).colorScheme.primary,
            ),
            customWidget,
          ],
        ),
      ),
    );
  }
}
