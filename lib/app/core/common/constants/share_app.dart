import 'dart:io';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

void shareApp(BuildContext context) {
  String appLink = Platform.isAndroid
      ? 'https://play.google.com/store/apps/details?id=com.dijlah.inteshar'
      : 'https://apps.apple.com/app/alshams/id1579161980';

  final RenderBox box = context.findRenderObject() as RenderBox;
  Share.share(
    appLink,
    subject: 'أدعوك للاطلاع على هذا التطبيق',
    sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
  );
}
