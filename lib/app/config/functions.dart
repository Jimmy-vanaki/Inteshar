import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:device_info_plus/device_info_plus.dart';

String? formatNumber(int? number) {
  if (number == null || number == 0) {
    return null;
  }
  return number.toString().replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
        (Match match) => '${match.group(1)},',
      );
}

String dateFormat(String dateStr) {
  try {
    DateTime dateTime = DateTime.parse(dateStr);
    return DateFormat('yyyy/MM/dd').format(dateTime);
  } catch (e) {
    return 'تاریخ نامعتبر';
  }
}

Color colorFromHex(String hexColor) =>
    Color(int.parse(hexColor.replaceFirst('#', '0xFF')));

String removeHtmlTags(String htmlString) {
  final RegExp tagRegExp =
      RegExp(r'<[^>]*>', multiLine: true, caseSensitive: true);
  htmlString = htmlString.replaceAll('&nbsp;', ' ');
  htmlString = htmlString.replaceAll('<br />', '\n');

  return htmlString.replaceAll(tagRegExp, '');
}

Future<String?> getId() async {
  var deviceInfo = DeviceInfoPlugin();
  var storage = const FlutterSecureStorage();

  if (Platform.isIOS) {
    var iosDeviceInfo = await deviceInfo.iosInfo;
    var deviceId = iosDeviceInfo.identifierForVendor ?? const Uuid().v4();
    await storage.write(key: 'device_id', value: deviceId);

    return deviceId;
  } else if (Platform.isAndroid) {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    var androidId = androidDeviceInfo.id;

    await storage.write(key: 'device_id', value: androidId);

    return androidId;
  } else {
    return null;
  }
}
