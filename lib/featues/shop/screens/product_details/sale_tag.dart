import 'package:flutter/material.dart';
import 'package:s_store/common/common.widgets/rounded_container.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/sizes.dart';

class CustomSaleTag extends StatelessWidget {
  const CustomSaleTag({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      radius: Sizes.sm,
      backgroundColor: Colors.yellow.withOpacity(0.9),
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.sm,
        vertical: Sizes.sm / 2,
      ),
      child: Text(
        '25%',
        style:
            Theme.of(context).textTheme.labelLarge!.apply(color: CColors.black),
      ),
    );
  }
}
