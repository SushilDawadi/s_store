import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_store/featues/authentication/controllers/onboarding_controller.dart';
import 'package:s_store/featues/authentication/screens/onboarding/widgets/onboading_button.dart';
import 'package:s_store/featues/authentication/screens/onboarding/widgets/onboarding_dot.dart';
import 'package:s_store/featues/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:s_store/featues/authentication/screens/onboarding/widgets/onboarding_skip.dart';
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
                lottieImg: Images.lottieWelcome,
                onBoadingTitle: TextStrings.onBoardingTitle1,
                onBoardingSubtitle: TextStrings.onBoardingSubtitle1,
              ),
              OnBoardingPage(
                lottieImg: Images.lottieShopping,
                onBoadingTitle: TextStrings.onBoardingTitle2,
                onBoardingSubtitle: TextStrings.onBoardingSubtitle2,
              ),
              OnBoardingPage(
                lottieImg: Images.lottieDelivery,
                onBoadingTitle: TextStrings.onBoardingTitle3,
                onBoardingSubtitle: TextStrings.onBoardingSubtitle3,
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
