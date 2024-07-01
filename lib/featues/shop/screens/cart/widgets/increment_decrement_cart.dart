import 'package:flutter/material.dart';
import 'package:s_store/common/circular_icon.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/sizes.dart';

class IncrementDecrementCart extends StatelessWidget {
  const IncrementDecrementCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      children: [
        const SizedBox(
          width: 70,
        ),
        CustomCircularIcon(
          width: 32,
          height: 32,
          size: 15,
          color: Colors.white,
          icon: Icons.remove,
          backgroundColor: dark ? CColors.darkGrey : CColors.lightGrey,
        ),
        const SizedBox(
          width: Sizes.md,
        ),
        Text(
          "2",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          width: Sizes.md,
        ),
        const CustomCircularIcon(
          width: 32,
          height: 32,
          backgroundColor: CColors.secondary,
          size: 15,
          color: Colors.white,
          icon: Icons.add,
        ),
      ],
    );
  }
}
