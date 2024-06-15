import 'package:flutter/material.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/constants/text_Strings.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Image(
          image: AssetImage(
            Images.darkAppLogo,
          ),
          height: 100,
        ),
        Text(
          TextStrings.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: Sizes.sm,
        ),
        Text(
          TextStrings.loginSubtitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(
          height: Sizes.spaceBtwItems,
        ),
      ],
    );
  }
}
