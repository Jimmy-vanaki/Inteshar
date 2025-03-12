import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:inteshar/app/config/constants.dart';
import 'package:inteshar/app/core/common/widgets/internal_page.dart';

class TextContent extends StatelessWidget {
  const TextContent({
    super.key,
    required this.title,
    required this.text,
  });
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InternalPage(
      title: title,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 20),
        padding: const EdgeInsets.all(20),
        decoration: Constants.intesharBoxDecoration(context).copyWith(
          color: Theme.of(context).colorScheme.primary,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              const Gap(20),
              Text(
                text,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  height: 2.5,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
