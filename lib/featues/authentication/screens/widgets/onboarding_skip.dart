import 'package:flutter/material.dart';
import 'package:s_store/featues/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: CDeviceUtils.getAppBarHeight(),
        right: CSizes.defaultSpace,
        child: TextButton(
          child: const Text("Skip"),
          onPressed: () {
            onBoardingController.instance.skipPage();
          },
        ));
  }
}
