import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/common/button.dart';
import 'package:s_store/common/divider.dart';
import 'package:s_store/common/social_buttons.dart';
import 'package:s_store/featues/authentication/controllers/signup_controller.dart';
import 'package:s_store/featues/authentication/screens/verify_email/verify.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/constants/text_Strings.dart';
import 'package:s_store/utils/validators/validation.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupController controller = Get.put(SignupController());
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                top: Sizes.defaultSpace,
                left: Sizes.defaultSpace,
                right: Sizes.defaultSpace,
                bottom: Sizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TextStrings.signUpTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                  // textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: Sizes.spaceBtwSections,
                ),
                Form(
                  key: controller.signUpFormKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              validator: (value) =>
                                  CustomValidators.emptyFieldValidator(
                                      value, "First Name"),
                              controller: controller.firstname,
                              expands: false,
                              decoration: const InputDecoration(
                                labelText: TextStrings.firstame,
                                prefixIcon: Icon(Iconsax.user),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: Sizes.spaceBtwInputFields,
                          ),
                          Expanded(
                            child: TextFormField(
                              validator: (value) =>
                                  CustomValidators.emptyFieldValidator(
                                      value, "Last Name"),
                              controller: controller.lastname,
                              expands: false,
                              decoration: const InputDecoration(
                                labelText: TextStrings.lastname,
                                prefixIcon: Icon(Iconsax.user),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: Sizes.spaceBtwInputFields,
                      ),
                      TextFormField(
                        validator: (value) =>
                            CustomValidators.emptyFieldValidator(
                                value, "Username"),
                        controller: controller.username,
                        decoration: const InputDecoration(
                          labelText: TextStrings.username,
                          prefixIcon: Icon(Iconsax.user_edit),
                        ),
                      ),
                      const SizedBox(
                        height: Sizes.spaceBtwInputFields,
                      ),
                      TextFormField(
                        validator: (value) => CustomValidators.emailValidator(
                          value,
                        ),
                        controller: controller.email,
                        decoration: const InputDecoration(
                          labelText: TextStrings.email,
                          prefixIcon: Icon(Iconsax.direct_right),
                        ),
                      ),
                      const SizedBox(
                        height: Sizes.spaceBtwInputFields,
                      ),
                      TextFormField(
                        validator: (value) =>
                            CustomValidators.phoneNumberValidator(value),
                        controller: controller.phone,
                        decoration: const InputDecoration(
                          labelText: TextStrings.phoneNumber,
                          prefixIcon: Icon(Iconsax.call),
                        ),
                      ),
                      const SizedBox(
                        height: Sizes.spaceBtwInputFields,
                      ),
                      Obx(
                        () => TextFormField(
                          validator: (value) =>
                              CustomValidators.passwordValidator(value),
                          controller: controller.password,
                          decoration: InputDecoration(
                            labelText: TextStrings.password,
                            prefixIcon: const Icon(Iconsax.password_check),
                            suffixIcon: IconButton(
                                onPressed: () => controller.hidePassword.value =
                                    !controller.hidePassword.value,
                                icon: controller.hidePassword.value
                                    ? const Icon(Iconsax.eye_slash)
                                    : const Icon(Iconsax.eye)),
                          ),
                          obscureText: controller.hidePassword.value,
                        ),
                      ),
                      const SizedBox(
                        height: Sizes.spaceBtwInputFields,
                      ),
                      Row(
                        children: [
                          Obx(
                            () => Checkbox(
                              value: controller.termsAndPolicy.value,
                              onChanged: (value) {
                                controller.termsAndPolicy.value = value!;
                              },
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  children: [
                                    TextSpan(
                                        text: '${TextStrings.iAgreeTo} ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                    TextSpan(
                                        text: '${TextStrings.privacyPolicy} ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .apply(
                                                color: CColors.secondary,
                                                decoration:
                                                    TextDecoration.underline)),
                                    TextSpan(
                                        text: 'and ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                    TextSpan(
                                      text: TextStrings.termsOfUse,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .apply(
                                              color: CColors.secondary,
                                              decoration:
                                                  TextDecoration.underline),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: Sizes.spaceBtwSections,
                      ),
                      CustomButton(
                        text: TextStrings.createAccount,
                        onPressed: () => controller.signUp(),
                        isFilled: true,
                      ),
                      const SizedBox(
                        height: Sizes.spaceBtwItems,
                      ),
                      const SizedBox(
                        height: Sizes.spaceBtwItems,
                      ),
                      const FormDivider(
                        dividerText: TextStrings.orSignUpWith,
                      ),
                      const SizedBox(
                        height: Sizes.spaceBtwItems,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialButtons(logoString: Images.googleLogo),
                          SizedBox(
                            width: Sizes.spaceBtwItems,
                          ),
                          SocialButtons(logoString: Images.facebookLogo),
                          SizedBox(
                            width: Sizes.spaceBtwItems,
                          ),
                          SocialButtons(logoString: Images.appleLogo),
                          SizedBox(
                            width: Sizes.spaceBtwItems,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
