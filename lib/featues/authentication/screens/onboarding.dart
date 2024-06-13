import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/constants/text_Strings.dart';
import 'package:s_store/utils/helpers/helper_functions.dart';

class onBoardingScreen extends StatelessWidget {
  const onBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: const [
              OnBoardingPage(
                lottieImg: CImages.lottieWelcome,
                onBoadingTitle: CTextString.onBoardingTitle1,
                onBoardingSubtitle: CTextString.onBoardingSubtitle1,
              ),
              OnBoardingPage(
                lottieImg: CImages.lottieShopping,
                onBoadingTitle: CTextString.onBoardingTitle2,
                onBoardingSubtitle: CTextString.onBoardingSubtitle2,
              ),
              OnBoardingPage(
                lottieImg: CImages.lottieDelivery,
                onBoadingTitle: CTextString.onBoardingTitle3,
                onBoardingSubtitle: CTextString.onBoardingSubtitle3,
              )
            ],
          )
        ],
      ),
    );
  }
}

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
      padding: const EdgeInsets.all(CSizes.defaultSpace),
      child: Column(
        children: [
          SizedBox(
            height: CHelperFunctions.screenHeight() * 0.6,
            width: CHelperFunctions.screenWidth() * 0.8,
            child: Lottie.asset(lottieImg),
          ),
          Text(
            onBoadingTitle,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: CSizes.spaceBtwItems),
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
