import 'package:flutter/material.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/sizes.dart';

class SocialButtons extends StatelessWidget {
  final String logoString;
  const SocialButtons({super.key, required this.logoString});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: dark ? CColors.dark : Colors.transparent,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: dark ? Colors.transparent : CColors.grey,
            ),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Image(
              height: Sizes.iconMd,
              width: Sizes.iconMd,
              image: AssetImage(logoString),
            ),
          ),
        ),
      ],
    );
  }
}
