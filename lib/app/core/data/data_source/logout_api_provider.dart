import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:inteshar/app/config/constants.dart';
import 'package:inteshar/app/config/handle_logout.dart';
import 'package:inteshar/app/core/routes/routes.dart';

final Dio dio = Dio(BaseOptions(
  receiveTimeout: const Duration(milliseconds: 10000),
  validateStatus: (status) {
    return status! < 500;
  },
));

Future<void> logout() async {
  print('======================${Constants.userToken}');
  try {
    final response = await dio.post(
      "${Constants.baseUrl}/logout",
      options: Options(
        headers: {
          'Authorization': 'Bearer ${Constants.userToken}',
          'Content-Type': 'application/json',
        },
      ),
    );
    print('======================${response.statusCode}');
    if (response.statusCode == 200) {
      Constants.localStorage.remove('userToken');
      Get.closeAllSnackbars();
      Get.snackbar('تنبيه', 'تم تسجيل الخروج بنجاح');
      Get.offAllNamed(Routes.welcomePage);
    } else if (response.statusCode == 401) {
      handleLogout(response.data['error']);
    } else {
      Get.closeAllSnackbars();
      Get.snackbar('تنبيه', 'لم يتم تسجيل الخروج، يرجى اعادة المحاولة!');
    }
  } catch (e) {
    Get.closeAllSnackbars();
    Get.snackbar('تنبيه', 'لم يتم تسجيل الخروج، يرجى اعادة المحاولة!');
    print(e);
  }
}
