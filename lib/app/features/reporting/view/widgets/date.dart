import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:Inteshar/app/config/constants.dart';

class ReportingDate extends StatelessWidget {
  const ReportingDate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/svgs/calendar-days.svg',
          width: 20,
          height: 20,
          colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.primary,
            BlendMode.srcIn,
          ),
        ),
        const Gap(5),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
          decoration: Constants.intesharBoxDecoration(context).copyWith(
            border: Border(
              right: BorderSide(
                color: Theme.of(context).colorScheme.primary.withAlpha(50),
                width: 8,
              ),
            ),
          ),
          child: InkWell(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    BoardDateFormat('yyyy/MM/dd').format(DateTime.now()),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                const Gap(10),
                SvgPicture.asset(
                  'assets/svgs/angle-small-down.svg',
                  width: 15,
                  height: 15,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
            onTap: () async {
              await showBoardDateTimePicker(
                context: context,
                pickerType: DateTimePickerType.date,
                options: const BoardDateTimeOptions(
                  showDateButton: false,
                  pickerFormat: PickerFormat.ymd,
                  boardTitle: 'حدد التاريخ المطلوب',
                ),
              );
            },
          ),
        ),
        const Gap(5),
        const Text('الی'),
        const Gap(5),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
          decoration: Constants.intesharBoxDecoration(context).copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
            border: Border(
              right: BorderSide(
                color: Theme.of(context).colorScheme.primary.withAlpha(50),
                width: 8,
              ),
            ),
          ),
          child: InkWell(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    BoardDateFormat('yyyy/MM/dd').format(DateTime.now()),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                const Gap(10),
                SvgPicture.asset(
                  'assets/svgs/angle-small-down.svg',
                  width: 15,
                  height: 15,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
            onTap: () async {
              await showBoardDateTimePicker(
                context: context,
                pickerType: DateTimePickerType.date,
                options: const BoardDateTimeOptions(
                  showDateButton: false,
                  pickerFormat: PickerFormat.ymd,
                  boardTitle: 'حدد التاريخ المطلوب',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
