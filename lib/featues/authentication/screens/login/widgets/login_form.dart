import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
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

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(TextStrings.signIn),
                ),
              ),
              const SizedBox(
                height: Sizes.spaceBtwItems,
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text(TextStrings.createAccount),
                ),
              ),
              const SizedBox(
                height: Sizes.spaceBtwSections,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
