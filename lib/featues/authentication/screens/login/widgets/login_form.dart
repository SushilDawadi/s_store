import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/common/button.dart';
import 'package:s_store/featues/authentication/controllers/login_controller.dart';
import 'package:s_store/featues/authentication/screens/sign_up/sign_up.dart';
import 'package:s_store/navigation_menu.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/constants/text_Strings.dart';
import 'package:s_store/utils/validators/validation.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Column(
      children: [
        Form(
          key: controller.loginFormKey,
          child: Column(
            children: [
              const SizedBox(
                height: Sizes.spaceBtwItems,
              ),
              TextFormField(
                validator: (value) => CustomValidators.emailValidator(value),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: TextStrings.email,
                ),
                controller: controller.email,
              ),
              const SizedBox(
                height: Sizes.spaceBtwInputFields,
              ),
              Obx(
                () => TextFormField(
                  validator: (value) =>
                      CustomValidators.passwordValidator(value),
                  obscureText: !controller.hidePassword.value,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.lock),
                    labelText: TextStrings.password,
                    suffixIcon: IconButton(
                      icon: Icon(controller.hidePassword.value
                          ? Iconsax.eye
                          : Iconsax.eye_slash),
                      onPressed: () {
                        controller.hidePassword.value =
                            !controller.hidePassword.value;
                      },
                    ),
                  ),
                  controller: controller.password,
                ),
              ),
              const SizedBox(
                height: Sizes.spaceBtwInputFields / 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Remeber me
                  Row(
                    children: [
                      Obx(
                        () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) {
                            controller.rememberMe.value =
                                !controller.rememberMe.value;
                          },
                        ),
                      ),
                      Text(
                        TextStrings.rememberMe,
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(TextStrings.forgetPassword),
                  ),
                ],
              ),
              //Sign in button
              const SizedBox(
                height: Sizes.spaceBtwSections,
              ),
              CustomButton(
                onPressed: () {
                  controller.emailAndPasswordSignIn();
                },
                text: TextStrings.signIn,
                isFilled: true,
              ),
              const SizedBox(
                height: Sizes.spaceBtwItems,
              ),
              CustomButton(
                  onPressed: () {
                    Get.to(() => const SignUp());
                  },
                  text: TextStrings.createAccount,
                  isFilled: false),
              const SizedBox(
                height: Sizes.spaceBtwSections,
              ),

              //
            ],
          ),
        ),
      ],
    );
  }
}
