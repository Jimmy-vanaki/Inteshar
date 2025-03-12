import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class Separator extends StatelessWidget {
  const Separator({
    super.key,
    required this.title,
    this.ontap,
  });
  final String title;
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/svgs/bullet.svg',
                width: 13,
                height: 13,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.secondary,
                  BlendMode.srcIn,
                ),
              ),
              Text(
                title,
              ),
            ],
          ),
          // Expanded(
          //   child: Divider(
          //     endIndent: 10,
          //     indent: 10,
          //     color: Theme.of(context).colorScheme.secondary,
          //   ),
          // ),
          if (ontap != null)
            Row(
              children: [
                ZoomTapAnimation(
                  onTap: ontap,
                  child: Text(
                    'المزيد',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                const Gap(2),
                SvgPicture.asset(
                  'assets/svgs/angle-left.svg',
                  width: 13,
                  height: 13,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.secondary,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
