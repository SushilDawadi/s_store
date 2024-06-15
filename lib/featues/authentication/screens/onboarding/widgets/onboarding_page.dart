import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/helpers/helper_functions.dart';

class OnBoardingPage extends StatelessWidget {
  final String lottieImg;
  final String onBoadingTitle;
  final String onBoardingSubtitle;
  const OnBoardingPage({
    super.key,
    required this.onBoadingTitle,
    required this.onBoardingSubtitle,
    required this.lottieImg,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.defaultSpace),
      child: Column(
        children: [
          SizedBox(
            height: HelperFunctions.screenHeight() * 0.6,
            width: HelperFunctions.screenWidth() * 0.8,
            child: Lottie.asset(lottieImg),
          ),
          Text(
            onBoadingTitle,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Sizes.spaceBtwItems),
          Text(
            onBoardingSubtitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
