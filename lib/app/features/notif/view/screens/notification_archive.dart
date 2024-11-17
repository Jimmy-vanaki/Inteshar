import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:Inteshar/app/config/constants.dart';
import 'package:Inteshar/app/core/common/widgets/internal_page.dart';

class NotificationArchive extends StatelessWidget {
  const NotificationArchive({super.key});

  @override
  Widget build(BuildContext context) {
    return InternalPage(
      title: 'الاشعارات',
      customWidget: Container(
        margin: const EdgeInsets.all(20),
        // padding: const EdgeInsets.all(20),
        decoration: Constants.intesharBoxDecoration(context),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: 15,
          itemBuilder: (context, index) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20).copyWith(right: 30),
                  margin:
                      const EdgeInsets.all(20).copyWith(bottom: 0, right: 25),
                  decoration: Constants.intesharBoxDecoration(context).copyWith(
                    color: Theme.of(context).colorScheme.primary.withAlpha(30),
                    boxShadow: [],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'لوريم إيبسوم',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      const Gap(10),
                      Text(
                          'لوريم إيبسوم هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر.'),
                      const Gap(10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          BoardDateFormat('yyyy/MM/dd').format(DateTime.now()),
                          style: TextStyle(
                              fontSize: 11,
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
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
                      color: Theme.of(context).colorScheme.onPrimary,
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 3,
                        color: Theme.of(context).colorScheme.primary.withAlpha(30),
                      ),
                    ),
                    child: SvgPicture.asset(
                      'assets/svgs/bell.svg',
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
