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
import 'package:inteshar/app/features/notif/data/data_source/notif_api_provider.dart';

class NotificationArchive extends StatelessWidget {
  const NotificationArchive({super.key});

  @override
  Widget build(BuildContext context) {
    return InternalPage(
      title: 'الاشعارات',
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 20),
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: Constants.intesharBoxDecoration(context).copyWith(
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Constants.isLoggedIn
            ? Obx(
                () {
                  final NotifApiProvider notifApiProvider =
                      Get.put(NotifApiProvider());
                  switch (notifApiProvider.rxRequestStatus.value) {
                    case Status.loading:
                      return const Center(child: CustomLoading());
                    case Status.error:
                      return Center(
                          child: RetryWidget(
                        onTap: () => notifApiProvider.fetchNotifData(),
                      ));
                    case Status.completed:
                      if (notifApiProvider.notifDataList.isEmpty) {
                        return const Center(
                            child: Text("لا توجد إشعارات جديدة."));
                      }
                      final notif =
                          notifApiProvider.notifDataList.first.notifications!;
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: notifApiProvider
                                .notifDataList.first.notifications?.length ??
                            0,
                        itemBuilder: (context, index) {
                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(20)
                                    .copyWith(right: 30),
                                margin: const EdgeInsets.all(20)
                                    .copyWith(right: 25, top: 0),
                                decoration:
                                    Constants.intesharBoxDecoration(context)
                                        .copyWith(
                                  color: Theme.of(context).colorScheme.surface.withAlpha(90),
                                  boxShadow: [],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Gap(10),
                                    Text(
                                      notif[index].title ?? "No Title",
                                    ),
                                    const Gap(10),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        dateFormat(
                                            notif[index].dateFormat ?? ''),
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary
                                                .withAlpha(180)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                right: 5,
                                child: Container(
                                  width: 45,
                                  height: 45,
                                  padding: const EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 3,
                                      color:
                                          Theme.of(context).colorScheme.surface.withAlpha(90),
                                    ),
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/svgs/bell.svg',
                                    colorFilter: ColorFilter.mode(
                                      Theme.of(context).colorScheme.onPrimary,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    default:
                      return const Center(child: Text("وضعیت نامشخص"));
                  }
                },
              )
            : const OfflineWidget(),
      ),
    );
  }
}
