import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/common/button.dart';
import 'package:s_store/common/common.widgets/appbar/appbar.dart';
import 'package:s_store/featues/personalization/controllers/update_user_name_controller.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/validators/validation.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateUserNameController>(
      builder: (controller) {
        return Scaffold(
          appBar: CustomAppBar(
            title: const Text("Change Name"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(Sizes.defaultSpace),
            child: Form(
              key: controller.changeNameFormKey,
              child: Column(
                children: [
                  Text(
                    "Use real name for easy verification .This name will appear on several pages.",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const SizedBox(
                    height: Sizes.md,
                  ),
                  TextFormField(
                    validator: (value) => CustomValidators.emptyFieldValidator(
                        value, 'First Name'),
                    controller: controller.firstName,
                    decoration: const InputDecoration(
                      labelText: "First Name",
                      hintText: "Enter your first name",
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                  const SizedBox(
                    height: Sizes.md,
                  ),
                  TextFormField(
                    validator: (value) => CustomValidators.emptyFieldValidator(
                        value, 'Last Name'),
                    controller: controller.lastName,
                    decoration: const InputDecoration(
                      labelText: "Last Name",
                      hintText: "Enter your last name",
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                  const SizedBox(
                    height: Sizes.md,
                  ),
                  CustomButton(
                    text: "Save",
                    onPressed: () {
                      controller.updateName();
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
