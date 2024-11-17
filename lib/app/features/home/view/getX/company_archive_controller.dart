import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyArchiveController extends GetxController {
  final List<String> allCompanies = [
    'asiacell',
    'max cards',
    'irancell',
    'Date',
    'Elderberry',
    'Fig',
    'Grapes',
    'Honeydew',
  ];
  RxList filteredCompanies = [].obs;
  TextEditingController searchController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    filteredCompanies.value = allCompanies;

    searchController.addListener(() {
      filterListFunction();
    });
  }

  @override
  void onClose() {
    // dispose stream
    searchController.dispose();
    super.onClose();
  }

  // Function to filter the list based on search input
  void filterListFunction() {
    final query = searchController.text.toLowerCase();
    filteredCompanies.value = allCompanies
        .where((item) => item.toLowerCase().contains(query))
        .toList();
  }
}
