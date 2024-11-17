import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:Inteshar/app/config/constants.dart';
import 'package:Inteshar/app/core/routes/routes.dart';
import 'package:Inteshar/app/core/utils/custom_loading.dart';
import 'package:Inteshar/app/features/home/view/widgets/company_list_slider.dart';
import 'package:Inteshar/app/features/home/view/widgets/other_services.dart';
import 'package:Inteshar/app/features/home/view/widgets/product_list.dart';
import 'package:Inteshar/app/features/home/view/widgets/separator.dart';
import 'package:Inteshar/app/features/home/view/widgets/wallet_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(10),
            WalletCard(size: size),
            const Separator(title: 'خدمات مميزة'),
            const OtherServices(),
            const Gap(20),
            CarouselSlider(
              options: CarouselOptions(
                height: 120.0,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
              ),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.all(5.0),
                      height: 120,
                      clipBehavior: Clip.antiAlias,
                      decoration: Constants.intesharBoxDecoration(context),
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
                    );
                  },
                );
              }).toList(),
            ),
            Separator(title: 'الشركات', ontap: () {
              Get.toNamed(Routes.companiesArchivePage);
            }),
            const CompanyListSlider(),
            const Separator(title: 'مختارات'),
            ProductsList(),
            const Gap(90),
          ],
        ),
      ),
    );
  }
}
