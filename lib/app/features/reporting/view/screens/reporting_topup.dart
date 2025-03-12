import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:inteshar/app/config/constants.dart';
import 'package:inteshar/app/config/functions.dart';
import 'package:inteshar/app/config/status.dart';
import 'package:inteshar/app/core/common/widgets/internal_page.dart';
import 'package:inteshar/app/core/common/widgets/offline_widget.dart';
import 'package:inteshar/app/core/common/widgets/retry_widget.dart';
import 'package:inteshar/app/core/utils/custom_loading.dart';
import 'package:inteshar/app/features/reporting/data/data_source/topup_report_api_provider.dart';
import 'package:inteshar/app/features/reporting/view/getX/report_value_controller.dart';
import 'package:inteshar/app/features/reporting/view/widgets/date.dart';

class ReportingTopup extends StatelessWidget {
  const ReportingTopup({super.key});
  @override
  Widget build(BuildContext context) {
    TopupReportApiProvider topupReportApiProvider =
        Get.put(TopupReportApiProvider());
    ReportValueController reportValueController =
        Get.put(ReportValueController());

    TextStyle titleStyle = const TextStyle(fontSize: 15);
    TextStyle dataStyle =
        const TextStyle(fontWeight: FontWeight.w700, fontSize: 17);
    return InternalPage(
      title: 'تقارير الـ TopUp والباقات',
      child: Container(
        transform: Matrix4.translationValues(0, -1, 0),
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            const Gap(10),
            Container(
              alignment: Alignment.center,
              width: Get.width - 40,
              padding: const EdgeInsets.all(20),
              decoration: Constants.intesharBoxDecoration(context),
              child: Constants.isLoggedIn
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const ReportingDate(),
                        const Gap(10),
                        Obx(
                          () => ElevatedButton(
                            onPressed: topupReportApiProvider
                                        .rxRequestButtonStatus.value ==
                                    Status.loading
                                ? null
                                : () {
                                    topupReportApiProvider.fetchReportData(
                                      startDate:
                                          reportValueController.startDate.value,
                                      endDate:
                                          reportValueController.endDate.value,
                                    );
                                  },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/svgs/paper-plane-top.svg',
                                  width: 20,
                                  height: 20,
                                  colorFilter: ColorFilter.mode(
                                    Theme.of(context).colorScheme.onPrimary,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                const Gap(10),
                                const Text(
                                  'ارسال',
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Gap(10),
                        SizedBox(
                          width: Get.width,
                          height: Get.height - 265,
                          child: Obx(() {
                            switch (
                                topupReportApiProvider.rxRequestStatus.value) {
                              case Status.loading:
                                return const CustomLoading();
                              case Status.error:
                                return RetryWidget(
                                  onTap: () =>
                                      topupReportApiProvider.fetchReportData(
                                    startDate:
                                        reportValueController.startDate.value,
                                    endDate:
                                        reportValueController.endDate.value,
                                  ),
                                  // topupReportApiProvider.fetchReportData(
                                  //   startDate: '2025/02/16',
                                  //   endDate: '2025/02/16',
                                  // ),
                                );
                              case Status.completed:
                                return topupReportApiProvider.reportDataList
                                        .first.transactions.isNotEmpty
                                    ? ListView.builder(
                                        physics: const BouncingScrollPhysics(),
                                        itemCount: topupReportApiProvider
                                            .reportDataList
                                            .first
                                            .transactions
                                            .length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            padding: const EdgeInsets.all(10),
                                            margin: const EdgeInsets.only(
                                                bottom: 10),
                                            decoration:
                                                Constants.intesharBoxDecoration(
                                                        context)
                                                    .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary
                                                  .withAlpha(30),
                                              boxShadow: [],
                                            ),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      'النوع :',
                                                      style: titleStyle,
                                                    ),
                                                    const Gap(10),
                                                    Expanded(
                                                      child: Text(
                                                        topupReportApiProvider
                                                            .reportDataList
                                                            .first
                                                            .transactions[index]
                                                            .transactionType,
                                                        style: dataStyle,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Gap(5),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'الفئة :',
                                                      style: titleStyle,
                                                    ),
                                                    const Gap(10),
                                                    Expanded(
                                                      child: Text(
                                                        topupReportApiProvider
                                                            .reportDataList
                                                            .first
                                                            .transactions[index]
                                                            .asiacellProductTitle,
                                                        style: dataStyle,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Gap(5),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'الهاتف :',
                                                      style: titleStyle,
                                                    ),
                                                    const Gap(10),
                                                    Expanded(
                                                      child: Text(
                                                        topupReportApiProvider
                                                            .reportDataList
                                                            .first
                                                            .transactions[index]
                                                            .mobile,
                                                        style: dataStyle,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Gap(5),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'السعر :',
                                                      style: titleStyle,
                                                    ),
                                                    const Gap(10),
                                                    Expanded(
                                                      child: Text(
                                                        '${formatNumber(topupReportApiProvider.reportDataList.first.transactions[index].price)} IQD',
                                                        textAlign:
                                                            TextAlign.right,
                                                        textDirection:
                                                            TextDirection.ltr,
                                                        style: dataStyle,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Gap(5),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'التاريخ :',
                                                      style: titleStyle,
                                                    ),
                                                    const Gap(10),
                                                    Expanded(
                                                      child: Text(
                                                        topupReportApiProvider
                                                            .reportDataList
                                                            .first
                                                            .transactions[index]
                                                            .createdAtFormatted
                                                            .toString(),
                                                        style: dataStyle,
                                                        textAlign:
                                                            TextAlign.right,
                                                        textDirection:
                                                            TextDirection.ltr,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Gap(5),
                                              ],
                                            ),
                                          );
                                        })
                                    : const Center(
                                        child: Text('لا توجد بيانات لعرضها'));

                              default:
                                return const SizedBox.shrink();
                            }
                          }),
                        ),
                      ],
                    )
                  : const OfflineWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
