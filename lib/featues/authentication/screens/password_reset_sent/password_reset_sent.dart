import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:s_store/common/common.widgets/button.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/constants/text_Strings.dart';

class PasswordResetSent extends StatelessWidget {
  const PasswordResetSent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Padding(
            padding: EdgeInsets.only(right: Sizes.defaultSpace),
            child: Icon(
              Icons.close,
              size: Sizes.xl,
            ),
          ),
        )
      ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              Lottie.asset(Images.verifyEmail,
                  height: Sizes.lottieSize, width: double.infinity),
              Text(
                TextStrings.passwordResetSent,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: Sizes.spaceBtwItems,
              ),
              const Text("Sushildawadi14@gmail.com"),
              const SizedBox(
                height: Sizes.spaceBtwItems,
              ),
              Text(
                TextStrings.passwordResetSentSubtitle,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: Sizes.spaceBtwSections,
              ),
              CustomButton(
                onPressed: () {
                  Get.back();
                },
                text: "Done",
                isFilled: true,
              ),
              const SizedBox(
                height: Sizes.spaceBtwSections,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: TextStrings.resendEmail,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .apply(color: Theme.of(context).primaryColor)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
