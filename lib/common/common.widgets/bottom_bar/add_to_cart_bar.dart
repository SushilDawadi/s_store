import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/common/circular_icon.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/sizes.dart';

class AddToCartBar extends StatelessWidget {
  const AddToCartBar({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.defaultSpace / 2,
        horizontal: Sizes.defaultSpace,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(Sizes.md),
          topRight: Radius.circular(Sizes.md),
        ),
        color: dark
            ? CColors.darkerGrey.withOpacity(0.3)
            : CColors.lighterGrey.withOpacity(0.4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CustomCircularIcon(
                icon: Iconsax.minus,
                color: dark ? CColors.white : CColors.black,
              ),
              const SizedBox(width: Sizes.md),
              Text("2", style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(width: Sizes.md),
              CustomCircularIcon(
                icon: Icons.add,
                color: dark ? CColors.dark : CColors.white,
                backgroundColor: dark ? CColors.white : CColors.dark,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(
                  Sizes.md,
                ),
                backgroundColor: CColors.black),
            child: Row(
              children: [
                const Icon(
                  Icons.shopping_bag_outlined,
                  color: CColors.white,
                ),
                const SizedBox(width: Sizes.sm),
                Text("Add to Bag",
                    style: Theme.of(context).textTheme.titleMedium!.apply(
                          color: CColors.white,
                        )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
