import 'package:get/get.dart';

class CompanySliderController extends GetxController {
  RxInt selected = (-1).obs;
  RxInt activeCompany = (-1).obs;
  RxBool isLoading = false.obs;

  currentCompany(index) {
    selected.value = index;
  }
}
