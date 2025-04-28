import 'package:get/get.dart';
import 'package:inteshar/app/config/functions.dart';

class ReportValueController extends GetxController {
  RxString selectedCompany = '0'.obs;
  RxString selectedProduct = '0'.obs;
  final RxBool reportPrint = false.obs;
  RxString startDate = dateFormat(DateTime.now().toIso8601String()).obs;
  RxString endDate = dateFormat(DateTime.now().toIso8601String()).obs;

  setSelectedCompany(String value) {
    selectedCompany.value = value;
  }

  setSelectedProduct(String value) {
    selectedProduct.value = value;
  }

  setStartDate(String value) {
    startDate.value = value;
  }

  setEndDate(String value) {
    endDate.value = value;
  }
}
