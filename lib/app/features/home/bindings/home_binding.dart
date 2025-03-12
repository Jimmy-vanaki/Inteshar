import 'package:get/get.dart';
import 'package:inteshar/app/features/home/data/data_source/home_api_provider.dart';
import 'package:inteshar/app/features/home/data/data_source/products_api_provider.dart';
import 'package:inteshar/app/features/home/repositories/home_repository.dart';
import 'package:inteshar/app/features/home/view/getX/company_archive_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeApiProvider>(() => HomeApiProvider());
    Get.lazyPut<HomeRepository>(
        () => HomeRepository(Get.find<HomeApiProvider>()));
    Get.lazyPut<CompanyArchiveController>(() => CompanyArchiveController());
    Get.lazyPut<ProductsApiProvider>(() => ProductsApiProvider(), tag: 'random');

  }
}
