import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/featues/authentication/controllers/onboarding_controller.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/device/device_utility.dart';
import 'package:s_store/utils/helpers/helper_functions.dart';

class onBoardingElevatedButton extends StatelessWidget {
  const onBoardingElevatedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Positioned(
      right: Sizes.defaultSpace,
      bottom: DeviceUtils.getBottomNaviagationBarHeight(context) + 25,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: dark ? CColors.primary : CColors.dark,
        ),
        child: const Icon(
          Iconsax.arrow_right_3,
          size: Sizes.iconMd,
        ),
        onPressed: () {
          onBoardingController.instance.nextPage();
        },
      ),
    );
  }
}
