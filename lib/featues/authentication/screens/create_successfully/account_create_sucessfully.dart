import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:s_store/common/common.widgets/button.dart';
import 'package:s_store/featues/authentication/screens/forget_password/forget_password.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/constants/text_Strings.dart';

class AccountCreateSuccessfully extends StatelessWidget {
  const AccountCreateSuccessfully({super.key});

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
              Lottie.asset(Images.success,
                  height: Sizes.lottieSize, width: double.infinity),
              const SizedBox(
                height: Sizes.spaceBtwSections,
              ),
              Text(
                TextStrings.accountCreateSuccessfully,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: Sizes.spaceBtwItems,
              ),
              Text(
                TextStrings.accountCreateSuccessfullySubtitle,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: Sizes.spaceBtwSections,
              ),
              CustomButton(
                  text: "Continue",
                  onPressed: () {
                    Get.to(() => const ForgetPassword());
                  },
                  isFilled: true)
            ],
          ),
        ),
      ),
    );
  }
}
