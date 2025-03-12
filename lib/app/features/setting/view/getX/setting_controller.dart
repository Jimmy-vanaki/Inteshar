import 'package:get/get.dart';
import 'package:inteshar/app/config/constants.dart';

class SettingController extends GetxController {
  var settings = <String, bool>{}.obs;

  var defaultSettings = {
    "darkMode": false,
    "printQrcode": false,
    "printCardImage": false,
    "printInformation": false,
    "printBarCode": false,
  }.obs;

  @override
  void onInit() {
    super.onInit();
    var storedSettings = Constants.localStorage.read('settings');
    if (storedSettings != null) {
      settings.assignAll(Map<String, bool>.from(storedSettings));
    } else {
      settings.assignAll(Map<String, bool>.from(defaultSettings));
    }
  }

  void saveSetting(String key, bool value) {
    settings[key] = value;
    Constants.localStorage.write('settings', settings);
  }
}
