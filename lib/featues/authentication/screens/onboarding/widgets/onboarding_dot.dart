import 'package:flutter/material.dart';
import 'package:s_store/featues/authentication/controllers/onboarding_controller.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/device/device_utility.dart';
import 'package:s_store/utils/helpers/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDot extends StatelessWidget {
  const OnBoardingDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = onBoardingController.instance;
    final dark = HelperFunctions.isDarkMode(context);
    return Positioned(
        left: Sizes.defaultSpace,
        bottom: DeviceUtils.getBottomNaviagationBarHeight(context) + 25,
        child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          count: 3,
          effect: ExpandingDotsEffect(
              activeDotColor: dark ? CColors.light : CColors.dark,
              dotHeight: 6),
        ));
  }
}
