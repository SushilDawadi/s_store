import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:s_store/common/common.widgets/button.dart';
import 'package:s_store/featues/authentication/screens/create_successfully/account_create_sucessfully.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/constants/text_Strings.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: Sizes.defaultSpace),
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.close,
                size: Sizes.xl,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                Images.verifyEmail,
                height: Sizes.lottieSize,
                width: double.infinity,
              ),
              const SizedBox(
                height: Sizes.spaceBtwSections,
              ),
              Text(
                TextStrings.verifyYourEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: Sizes.spaceBtwItems,
              ),
              Text(
                "Support@sstore.com",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: Sizes.spaceBtwItems,
              ),
              Text(
                TextStrings.verifyYourEmailSubtitle,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: Sizes.spaceBtwSections,
              ),
              CustomButton(
                text: TextStrings.continue_,
                onPressed: () {
                  Get.to(() => const AccountCreateSuccessfully());
                },
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
                          .bodyMedium!
                          .apply(color: CColors.secondary),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
