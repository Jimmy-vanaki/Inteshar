import 'package:get/get.dart';
import 'package:inteshar/app/config/constants.dart';
import 'package:inteshar/app/config/status.dart';
import 'package:dio/dio.dart';
import 'package:inteshar/app/features/home/data/models/product_model.dart';

class ProductsApiProvider extends GetxController {
  var productsDataList = <ProductModel>[].obs;
  late Dio dio;
  final rxRequestStatus = Status.initial.obs;

  @override
  void onInit() {
    super.onInit();
    dio = Dio();
  }

  Future<void> fetchProducts(int companyId) async {
    print(companyId);
    print(Constants.userToken);
    rxRequestStatus.value = Status.loading;
    try {
      final response = await dio.post(
        "${Constants.baseUrl}/company_categories",
        queryParameters: {
          "company_id": companyId,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer ${Constants.userToken}',
          },
        ),
      );

      print(response.statusCode);
      print(response);

      if (response.statusCode == 200) {
        rxRequestStatus.value = Status.completed;

        productsDataList.clear();
        productsDataList.addAll(
          (response.data['card_categories'] as List)
              .map((item) => ProductModel.fromJson(item))
              .toList(),
        );
        print(response.statusCode);
      } else {
        rxRequestStatus.value = Status.error;
        Get.snackbar('خطأ', 'فشل في جلب البيانات.');
      }
    } catch (e) {
      print(e);
      rxRequestStatus.value = Status.error;
    }
  }
}
