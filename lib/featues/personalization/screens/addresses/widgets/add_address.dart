import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/common/button.dart';
import 'package:s_store/common/common.widgets/appbar/appbar.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/sizes.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: dark ? CColors.dark : CColors.white,
      appBar: CustomAppBar(
        title: const Text("Add New Address"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.md),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.user),
                  labelText: "Name",
                ),
              ),
              const SizedBox(
                height: Sizes.spaceBtwItems,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.call),
                  labelText: "Phone Number",
                ),
              ),
              const SizedBox(
                height: Sizes.spaceBtwItems,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.building),
                        labelText: "Street",
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: Sizes.spaceBtwItems,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.code),
                        labelText: "Postal Code",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: Sizes.spaceBtwItems,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.house),
                        labelText: "City",
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: Sizes.spaceBtwItems,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.location),
                        labelText: "State",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: Sizes.spaceBtwItems,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.global),
                  labelText: "Country",
                ),
              ),
              const SizedBox(
                height: Sizes.spaceBtwItems,
              ),
              CustomButton(text: "Save", onPressed: () {}, isFilled: true)
            ],
          ),
        ),
      ),
    );
  }
}
