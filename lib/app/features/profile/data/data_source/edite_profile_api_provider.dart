import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:inteshar/app/config/constants.dart';
import 'package:inteshar/app/config/handle_logout.dart';
import 'package:inteshar/app/config/status.dart';
import 'package:inteshar/app/core/common/widgets/exit_dialog.dart';
import 'package:inteshar/app/features/home/data/data_source/home_api_provider.dart';

class EditeProfileApiProvider extends GetxController {
  final rxRequestStatus = Status.initial.obs;
  final errorMessage = ''.obs;

  final Dio dio = Dio(BaseOptions(
    receiveTimeout: const Duration(milliseconds: 10000),
    validateStatus: (status) {
      return status! < 500;
    },
  ));

  Future<void> updateProfile({
    required String address,
    required String mobile,
    required String password,
    required String passwordConfirmation,
    required String? photo,
    required String? lat,
    required String? lon,
    }) async {
    rxRequestStatus.value = Status.loading;
    errorMessage.value = '';
    try {
      print('Lat: $lat, Long: $lon');
      final response = await dio.post(
        "${Constants.baseUrl}/update_profile",
        queryParameters: {
          'address': address,
          'mobile': mobile,
          'password': password,
          'password_confirmation': passwordConfirmation,
          'lat': lat,
          'lon': lon,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer ${Constants.userToken}',
            'Content-Type': 'application/json',
          },
        ),
        data: {
          'photo': photo,
        },
      );
      print('Update Profile${response.statusCode}');
      print('Update Profile${response.data}');

      if (response.statusCode == 200) {
        Constants.localStorage.remove('userInfo');
        Get.closeAllSnackbars();
        Get.snackbar('تنبيه', 'تم حفظ المعلومات');
        rxRequestStatus.value = Status.completed;
        final HomeApiProvider updateController = Get.find<HomeApiProvider>();
        await updateController.fetchHomeData();
      } else if (response.statusCode == 401) {
        handleLogout(response.data['error']['message']);
      } else {
        if ((response.data?['logged_in'] ?? 1) == 0) {
          rxRequestStatus.value = Status.error;
          exitDialog(response.data['errors'][0]);
        } else {
          errorMessage.value = 'لم يتم حفظ المعلومات بشكل صحيح';
          rxRequestStatus.value = Status.error;
        }
      }
    } catch (e) {
      errorMessage.value = 'لم يتم حفظ المعلومات بشكل صحيح';
      print('Login Error! :$e');
      rxRequestStatus.value = Status.error;
    }
  }
}
