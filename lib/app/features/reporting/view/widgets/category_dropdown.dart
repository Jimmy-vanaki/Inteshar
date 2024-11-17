import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:Inteshar/app/config/constants.dart';

class CategoryDropdown extends StatelessWidget {
  const CategoryDropdown({
    super.key,
    required this.itemList,
  });
  final List<DropdownMenuEntry<String>> itemList;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Expanded(
        child: Container(
          padding: const EdgeInsets.only(left: 8),
          decoration: Constants.intesharBoxDecoration(context).copyWith(
            border: Border(
              right: BorderSide(
                color: Theme.of(context).colorScheme.primary.withAlpha(50),
                width: 8,
              ),
            ),
          ),
          child: DropdownMenu(
            enableFilter: true,
            requestFocusOnTap: true,
            hintText: 'انتخاب',
            trailingIcon: SvgPicture.asset(
              'assets/svgs/angle-small-down.svg',
              width: 20,
              height: 20,
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.primary,
                BlendMode.srcIn,
              ),
            ),
            selectedTrailingIcon: SvgPicture.asset(
              'assets/svgs/angle-small-up.svg',
              width: 20,
              height: 20,
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.primary,
                BlendMode.srcIn,
              ),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              contentPadding: EdgeInsets.symmetric(vertical: 5.0),
              border: UnderlineInputBorder(borderSide: BorderSide.none),
            ),
            searchCallback: (entries, query) {
              print('======>'+entries.length.toString());
              return entries.length;
            },
            onSelected: (icon) {},
            dropdownMenuEntries: itemList,
          ),
        ),
      ),
    );
  }
}
