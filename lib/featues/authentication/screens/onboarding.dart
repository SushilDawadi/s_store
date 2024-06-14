import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_store/featues/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:s_store/featues/authentication/screens/widgets/onboading_button.dart';
import 'package:s_store/featues/authentication/screens/widgets/onboarding_dot.dart';
import 'package:s_store/featues/authentication/screens/widgets/onboarding_page.dart';
import 'package:s_store/featues/authentication/screens/widgets/onboarding_skip.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/constants/text_Strings.dart';

class onBoardingScreen extends StatelessWidget {
  const onBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(onBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
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
          ),
          const OnBoardingSkip(),
          const OnBoardingDot(),
          const onBoardingElevatedButton()
        ],
      ),
    );
  }
}
