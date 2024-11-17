import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class USerInformationWidget extends StatelessWidget {
  const USerInformationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> userInformations = [
      {
        "icon": 'envelope-open',
        "title": 'البريد الإلكتروني :',
        "data": 'm.vanaki77@gmail.com',
      },
      {
        "icon": 'phone-flip',
        "title": 'الهاتف :',
        "data": '09107722188',
      },
      {
        "icon": 'branding',
        "title": 'الاسم التجاري :',
        "data": 'شمس',
      },
      {
        "icon": 'marker',
        "title": 'العنوان :',
        "data": 'ويُستخدم في صناعات المطابع ودور النشر.صناعات صناعات',
      },
    ];

    return Column(
      children: [
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: userInformations.length,
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                children: [
                  const Gap(5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/${userInformations[index]['icon']}.svg',
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.primary,
                          BlendMode.srcIn,
                        ),
                      ),
                      const Gap(5),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 7),
                          child: Text(userInformations[index]['title']),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 7),
                          child: Text(
                            userInformations[index]['data'],
                            textAlign: TextAlign.start,
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(5),
                  const Divider(
                    indent: 20,
                    endIndent: 20,
                  ),
                ],
              ),
            );
          },
        ),
        const Gap(20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Theme.of(context).colorScheme.error,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'assets/svgs/leave.svg',
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.onError,
                    BlendMode.srcIn,
                  ),
                ),
                const Gap(10),
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    'خروج',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onError,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Gap(10),
        TextButton(
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/svgs/delete-user.svg',
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.error,
                  BlendMode.srcIn,
                ),
                width: 20,
                height: 20,
              ),
              const Gap(10),
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text(
                  'حذف حساب المستخدم',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
