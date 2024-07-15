import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/common/button.dart';
import 'package:s_store/common/common.widgets/appbar/appbar.dart';
import 'package:s_store/featues/personalization/controllers/user_controller.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/validators/validation.dart';

class ReAuthenticateUser extends StatelessWidget {
  const ReAuthenticateUser({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      builder: (controller) {
        return Scaffold(
          appBar: CustomAppBar(
            title: const Text("ReAuthenticate User"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(Sizes.defaultSpace),
            child: Form(
              key: controller.reAuthKey,
              child: Column(
                children: [
                  Text(
                    "ReAuthenticate User to continue.",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const SizedBox(
                    height: Sizes.md,
                  ),
                  TextFormField(
                    validator: (value) =>
                        CustomValidators.emailValidator(value),
                    controller: controller.verifyEmail,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      hintText: "Email",
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                  const SizedBox(
                    height: Sizes.md,
                  ),
                  TextFormField(
                    validator: (value) =>
                        CustomValidators.passwordValidator(value),
                    controller: controller.verifyPassword,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      hintText: "Enter your password",
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                  const SizedBox(
                    height: Sizes.md,
                  ),
                  CustomButton(
                    text: "Save",
                    onPressed: () {
                      controller.reAuthenticateEmailAndPasswordUser();
                    },
                    isFilled: true,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
