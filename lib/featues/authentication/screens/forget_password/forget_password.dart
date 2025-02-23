import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/common/button.dart';
import 'package:s_store/featues/authentication/controllers/forget_password_controller.dart';
import 'package:s_store/featues/authentication/screens/password_reset_sent/password_reset_sent.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/constants/text_Strings.dart';
import 'package:s_store/utils/routes.dart';
import 'package:s_store/utils/validators/validation.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPasswordController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            actions: [
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
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                top: Sizes.appBarHeight,
                left: Sizes.defaultSpace,
                right: Sizes.defaultSpace,
                bottom: Sizes.defaultSpace,
              ),
              child: Form(
                key: controller.forgetPasswordFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      TextStrings.forgetPassword,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(
                      height: Sizes.spaceBtwItems,
                    ),
                    Text(
                      TextStrings.forgetPasswordSubtitle,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(
                      height: Sizes.spaceBtwSections,
                    ),
                    TextFormField(
                      validator: (value) =>
                          CustomValidators.emailValidator(value),
                      controller: controller.email,
                      decoration: const InputDecoration(
                        labelText: TextStrings.email,
                        prefixIcon: Icon(Iconsax.direct_right),
                      ),
                    ),
                    const SizedBox(
                      height: Sizes.spaceBtwSections,
                    ),
                    CustomButton(
                      text: TextStrings.submit,
                      onPressed: () {
                        controller.sentForgetPasswordEmail();
                      },
                      isFilled: true,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
