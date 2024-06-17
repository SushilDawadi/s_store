import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/common/common.widgets/button.dart';
import 'package:s_store/featues/authentication/screens/sign_up/sign_up.dart';
import 'package:s_store/navigation_menu.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/constants/text_Strings.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: TextStrings.email,
                ),
              ),
              const SizedBox(
                height: Sizes.spaceBtwInputFields,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.lock),
                  labelText: TextStrings.password,
                  suffixIcon: Icon(Iconsax.eye_slash),
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
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
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

              CustomButton(
                onPressed: () {
                  Get.to(
                    () => const NavigationMenu(),
                  );
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
