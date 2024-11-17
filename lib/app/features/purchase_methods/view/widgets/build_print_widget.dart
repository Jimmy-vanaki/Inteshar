import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:Inteshar/app/features/setting/view/getX/setting_controller.dart';

class PrintWidget extends StatelessWidget {
  const PrintWidget({super.key});
  @override
  Widget build(BuildContext context) {
    SettingController settingController = Get.put(SettingController());
    const double mainPadding = 3.0;
    const TextStyle boldTextStyle8 = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 18,
    );
    const TextStyle boldTextStyle10 = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 20,
    );

    return Container(
      padding: const EdgeInsets.all(mainPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/images/logo-01.png',
            width: 50,
            height: 50,
            fit: BoxFit.fill,
          ),
          Text('MTN telecom', style: boldTextStyle8),
          Text('للاتصالات', style: boldTextStyle8),
          _buildLabeledContainer('علی الساعدی'),
          _buildAlignText('Terminal ID : 2024', boldTextStyle8),
          _buildAlignText('Time : ${TimeOfDay.now()}', boldTextStyle8),
          _buildAlignText('Order Number : 125874695', boldTextStyle8),
          const Gap(5),
          Visibility(
            visible: settingController.settings["printQrcode"] ?? false,
            child: SizedBox(
              height: 140,
              width: double.infinity,
              child: Image.asset('assets/images/card.jpg'),
            ),
          ),
          Text('Asiacell 15000', style: boldTextStyle10),
          const Gap(5),
          _buildAlignText('serial : 658945235471682', boldTextStyle8),
          _buildAlignText('Pin Code :', boldTextStyle8),
          Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              '658945235471682',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ),
          Visibility(
            visible: settingController.settings["printQrcode"] ?? false,
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Image.asset(
                'assets/images/qrcode.png',
                height: 100,
                width: 100,
              ),
              decoration: (settingController.settings["printInformation"] ??
                      false)
                  ? const BoxDecoration(border: Border(bottom: BorderSide()))
                  : const BoxDecoration(),
            ),
          ),
          Visibility(
            visible: settingController.settings["printInformation"] ?? false,
            child: _buildInstructionsText(),
          ),
          const Gap(4),
        ],
      ),
    );
  }

  Widget _buildLabeledContainer(String text) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.symmetric(horizontal: BorderSide()),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildAlignText(String text, TextStyle style) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(text, style: style),
    );
  }

  Widget _buildInstructionsText() {
    return const Padding(
      padding: EdgeInsets.only(top: 5),
      child: Text(
        '١- لتعبئة الإنترنت: *233* ثم رقم البطاقة ثم # ثم اتصال\n'
        '٢- لتعبئة الرصيد: *133* ثم رقم البطاقة ثم # ثم اتصال\n'
        '٣- البطاقات متوفّرة في مراكز آسياسيل ونقاط البيع الرئيسية\n'
        '٤- أن الإستخدام المجاني لـمواقع التواصل الإجتماعي لا يشمل مكالمات الفيديو والمكالمات الصوتية '
        'لباقات السرعة (فري سوشيال+)، ويتم إحتسابها من رصيد الإنترنت الأساسي.',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
