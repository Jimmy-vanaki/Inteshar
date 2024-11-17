import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:Inteshar/app/config/constants.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: size.width,
      padding: const EdgeInsets.all(20),
      alignment: Alignment.center,
      decoration: Constants.intesharBoxDecoration(context).copyWith(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/bg-v-card.png',
          ),
          colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.primary, BlendMode.color),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.onPrimary, BlendMode.srcIn),
            child: Image.asset(
              'assets/images/logo-01.png',
              width: 70,
              height: 60,
            ),
          ),
          Text(
            'mohammad vanaki',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'm.vanaki77@gmail.com',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 11,
            ),
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  '      رصيدك',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 15,
                  ),
                ),
              ),
              Text(
                '1,250,000',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Expanded(
                child: Text(
                  '    IQD',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
