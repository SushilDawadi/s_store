import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/common/rounded_container.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/sizes.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({
    super.key,
    this.selectedAddress = false,
  });
  final bool selectedAddress;
  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return CustomRoundedContainer(
      backgroundColor: selectedAddress
          ? CColors.secondary.withOpacity(0.5)
          : Colors.transparent,
      width: double.infinity,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
              ? CColors.darkGrey
              : CColors.grey,
      showborder: true,
      margin: const EdgeInsets.only(bottom: Sizes.spaceBtwItems),
      padding: const EdgeInsets.all(12.0),
      child: Stack(
        children: [
          Positioned(
            right: 10,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress ? CColors.white : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sushil Dawadi",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: Sizes.xs,
              ),
              Text(
                "9825157838",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const Text(
                "98562 Kanya Marga ,Nadipur ,Pokhara ,33700 ,Nepal ",
                softWrap: true,
              )
            ],
          )
        ],
      ),
    );
  }
}
