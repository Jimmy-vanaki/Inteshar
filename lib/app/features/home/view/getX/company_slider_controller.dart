import 'package:get/get.dart';

class CompanySliderController extends GetxController {
  RxInt selected = 0.obs;

  currentCompany(index) {
    selected.value = index;
  }
}
