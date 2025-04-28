import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inteshar/app/config/constants.dart';
import 'package:inteshar/app/config/handle_logout.dart';
import 'package:inteshar/app/config/status.dart';
import 'package:inteshar/app/core/common/widgets/exit_dialog.dart';
import 'package:inteshar/app/features/home/data/data_source/home_api_provider.dart';
import 'package:inteshar/app/features/services/view/widgets/result_page.dart';

class ServiceApiProvider extends GetxController {
  final RxString errorMessage = ''.obs;
  final Dio dio = Dio(BaseOptions(
    receiveTimeout: const Duration(milliseconds: 10000),
    validateStatus: (status) {
      return status! < 500;
    },
  ));

  final rxRequestStatus = Status.initial.obs;
  final HomeApiProvider updateController = Get.find<HomeApiProvider>();

  Future fetchTransaction({
    required String phone,
    required String categoryId,
    required String type,
    required String price,
    required String category,
    required String title,
    required BuildContext context,
  }) async {
    rxRequestStatus.value = Status.loading;
    print(categoryId);
    print(type);
    print(phone);

    try {
      final response = await dio.post(
        "${Constants.baseUrl}/masal_transaction",
        queryParameters: {
          'mobile': phone,
          'category': categoryId,
          'type': type,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer ${Constants.userToken}',
            'Content-Type': 'application/json',
          },
        ),
      );
      print('++++++++++${response.statusCode}');
      print('++++++++++${response}');
      if (response.statusCode == 200) {
        rxRequestStatus.value = Status.completed;
        updateController.inventory.value = response.data['inventory'];
        updateController.update();
        Get.back();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(
              phone: phone,
              trackingCode: response.data['data'],
              price: price,
              category: category,
              title: title,
            ),
          ),
        );
      } else if (response.statusCode == 401) {
        handleLogout(response.data['error']);
      } else {
        if ((response.data?['logged_in'] ?? 1) == 0) {
          rxRequestStatus.value = Status.completed;
          exitDialog(response.data['errors'][0]);
        } else {
          rxRequestStatus.value = Status.error;
          errorMessage.value = response.data['message'];
          Get.closeAllSnackbars();
          Get.snackbar('خطأ', response.data['message']);
        }
      }
    } catch (e) {
      rxRequestStatus.value = Status.error;
      Get.closeAllSnackbars();
      Get.snackbar('خطأ', 'فشل في جلب البيانات.');
      errorMessage.value = 'لم تتم العملية بشكل صحيح، يرجى اعادة المحاولة';
      print(e);
    }
  }
}
