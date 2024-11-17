import 'package:flutter_sms/flutter_sms.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:Inteshar/app/core/routes/routes.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';


manageMethods({required int type}) async {
  switch (type) {
    case 0:
      //print
      Get.toNamed(Routes.bluetoothPage);
      break;
    case 1:
      //share
      Share.share('Pin Code : 0-0239ujrw12', subject: 'Check this out!');
      break;
    case 2:
      //screenshot

      break;
    case 3:
      //copy
      await Clipboard.setData(
        const ClipboardData(text: 'Pin Code : 0-0239ujrw12'),
      );
      break;
    case 4:
      //directCharging
      _callNumber('*133*Pin Code : 0-0239ujrw12#');

      break;
    case 5:
      //SMS
      _sendSMS('Pin Code : 0-0239ujrw12', []);
      break;
    default:
  }
}

_callNumber(String ussd) async {
  await FlutterPhoneDirectCaller.callNumber(ussd);
}

void _sendSMS(String message, List<String> recipents) async {
  String result = await sendSMS(message: message, recipients: recipents)
      .catchError((onError) {
    debugPrint(onError);
    return '';
  });
  debugPrint(result);
}

