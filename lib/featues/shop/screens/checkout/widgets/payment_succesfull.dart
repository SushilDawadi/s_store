import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:s_store/common/button.dart';
import 'package:s_store/navigation_menu.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/constants/sizes.dart';

class PaymentSuccesfull extends StatelessWidget {
  const PaymentSuccesfull({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: Sizes.appBarHeight,
            left: Sizes.defaultSpace,
            right: Sizes.defaultSpace,
            bottom: Sizes.defaultSpace,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(Images.paymentSuccess,
                  height: Sizes.lottieSize, width: double.infinity),
              Text(
                "Payment Successful!",
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: Sizes.spaceBtwSections,
              ),
              CustomButton(
                  text: "Continue",
                  onPressed: () {
                    Get.to(() => const NavigationMenu());
                  },
                  isFilled: true)
            ],
          ),
        ),
      ),
    );
  }
}
