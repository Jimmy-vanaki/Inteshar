// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:inteshar/app/config/constants.dart';
// import 'package:inteshar/app/config/functions.dart';
// import 'package:inteshar/app/config/handle_logout.dart';
// import 'package:inteshar/app/core/data/models/update_info_model.dart';

// class UpdateController extends GetxController {
//   late Dio dio;
//   var userData = <UpdateInfoModel>[].obs;
//   final String token = Constants.userToken;
//   var isUpdating = true.obs;
//   String deviceId = '';
//   RxInt inventory = 000.obs;
//   var timerReset = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     dio = Dio();

//     startAutoUpdate();
//   }

//   /// Resumes the updating process
//   void resumeUpdating() {
//     isUpdating.value = true;
//     startAutoUpdate();
//   }

//   /// Starts the automatic update process
//   void startAutoUpdate() {
//     timerReset.value = false;
//     Future.doWhile(() async {
//       if (!isUpdating.value || timerReset.value) {
//         return false;
//       }
//       await updateInformation();
//       await Future.delayed(const Duration(seconds: 30));
//       return isUpdating.value;
//     });
//   }

//   void stopUpdating() {
//     isUpdating.value = false;
//     timerReset.value = true;
//     dio.close(force: true);
//   }

//   /// Updates user information from the API
//   Future<bool> updateInformation() async {
//     print('Token: ${Constants.userToken}');
//     try {
//       isUpdating.value = true;
//       deviceId = (await getId())!;
//       final response = await dio.post(
//         "${Constants.baseUrl}/info",
//         queryParameters: {
//           'device_token': deviceId,
//         },
//         options: Options(
//           headers: {
//             'Authorization': 'Bearer ${Constants.userToken}',
//             'Content-Type': 'application/json',
//           },
//         ),
//       );

//       print('Response Status Code: ${response.statusCode}');
//       print(response.data['user']['agent']?['primary_color']);
//       print(response.data['user']['agent']?['on_primary_color']);
//       if (response.statusCode == 200) {
//         if (response.data['logged_in'] == 0) {
//           handleLogout('تم تسجيل خروجك من قبل المشرف!');
//           return false;
//         }

//         // await _handleThemeChange(response);
//         await _updateUserData(response);
//         inventory.value = response.data['user']['total_balance'];
//         return true;
//       } else if (response.statusCode == 401) {
//         handleLogout(response.data['error']['message']);
//         return false;
//       } else {
//         return false;
//       }
//     } catch (e) {
//       print('Error: $e');
//       return false;
//     }
//   }

//   /// Handles theme color changes
//   Future<void> _handleThemeChange(response) async {
//     // Helper function to validate and return a proper hex color
//     String getValidColor(String? color, String defaultColor) {
//       if (color != null && color.isNotEmpty && color.startsWith('#')) {
//         return color;
//       }
//       return defaultColor;
//     }

//     // Default colors
//     const String defaultPrimaryColor = "#FF967832";
//     const String defaultOnPrimaryColor = "#FFFFFAF0";

//     // Get current user data colors or use defaults
//     final primaryColor = (userData.isNotEmpty)
//         ? getValidColor(
//             userData.first.user?.agent?.primaryColor, defaultPrimaryColor)
//         : defaultPrimaryColor;

//     final onPrimaryColor = (userData.isNotEmpty)
//         ? getValidColor(
//             userData.first.user?.agent?.onPrimaryColor, defaultOnPrimaryColor)
//         : defaultOnPrimaryColor;

//     // Convert current colors to Color objects
//     final Color oldPrimaryColor = colorFromHex(primaryColor);
//     final Color oldOnPrimaryColor = colorFromHex(onPrimaryColor);

//     // Extract new colors from response and validate
//     final responseData = response.data['user']?['agent'];

//     final Color newPrimary = colorFromHex(
//       getValidColor(responseData?['primary_color'], defaultPrimaryColor),
//     );

//     final Color newOnPrimaryColor = colorFromHex(
//       getValidColor(responseData?['on_primary_color'], defaultOnPrimaryColor),
//     );

//     // If colors have changed, update the theme
//     if (oldPrimaryColor != newPrimary ||
//         oldOnPrimaryColor != newOnPrimaryColor) {
//       Get.changeTheme(
//         ThemeData(
//           brightness: Brightness.light,
//           fontFamily: 'dijlah',
//           useMaterial3: true,
//           dividerTheme: DividerThemeData(
//             color: newPrimary.withAlpha(50),
//           ),
//           elevatedButtonTheme: ElevatedButtonThemeData(
//             style: ElevatedButton.styleFrom(
//               foregroundColor: newOnPrimaryColor,
//               backgroundColor: newPrimary,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//           ),
//           colorScheme: ColorScheme(
//             brightness: Brightness.light,
//             primary: newPrimary,
//             onPrimary: newOnPrimaryColor,
//             surface: newOnPrimaryColor,
//             onSurface: newPrimary,
//             secondary: const Color.fromARGB(255, 240, 205, 140),
//             onSecondary: const Color(0xff22323f),
//             error: const Color.fromARGB(255, 249, 52, 62),
//             onError: const Color(0xffffb4ab),
//             tertiary: const Color.fromARGB(255, 200, 200, 200),
//           ),
//         ),
//       );
//     }
//   }

//   /// Updates user data
//   Future<void> _updateUserData(response) async {
//     userData.clear();
//     userData.add(UpdateInfoModel.fromJson(response.data));
//   }
// }
