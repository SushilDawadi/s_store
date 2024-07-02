import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/common/common.widgets/appbar/appbar.dart';
import 'package:s_store/common/heading.dart';
import 'package:s_store/common/common.widgets/images/circular_image.dart';
import 'package:s_store/common/common.widgets/divider/divider.dart';
import 'package:s_store/featues/personalization/screens/settings/widgets/profile_menu_tile.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/constants/sizes.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: Sizes.defaultSpace,
              ),
              const CustomCircularImage(
                image: Images.profileImage,
                fit: BoxFit.cover,
                height: 90,
                width: 90,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Change Profile Picture",
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: CColors.minimalText,
                      ),
                ),
              ),
              const CustomDivider(
                padding: EdgeInsets.only(bottom: Sizes.sm, top: Sizes.sm),
              ),
              CustomHeading(
                padding: const EdgeInsets.symmetric(
                  vertical: Sizes.defaultSpace / 2,
                  horizontal: Sizes.defaultSpace,
                ),
                text: "Profile Information",
                showButton: false,
                fontSizeFactor: 1,
                color: dark ? CColors.white : CColors.black,
              ),
              const SizedBox(
                height: Sizes.sm,
              ),
              ProfileMenuTile(
                onTap: () {},
                title: "Name",
                value: "Sushil Dawadi",
              ),
              ProfileMenuTile(
                onTap: () {},
                title: "Username",
                value: "Sushil_Dawadi01",
              ),
              const CustomDivider(
                padding: EdgeInsets.only(top: Sizes.md),
              ),
              CustomHeading(
                padding: const EdgeInsets.symmetric(
                  vertical: Sizes.defaultSpace / 2,
                  horizontal: Sizes.defaultSpace,
                ),
                text: "Personal Information",
                showButton: false,
                fontSizeFactor: 1,
                color: dark ? CColors.white : CColors.black,
              ),
              const SizedBox(
                height: Sizes.sm,
              ),
              ProfileMenuTile(
                onTap: () {},
                title: "UserID",
                value: "4589",
                icon: Iconsax.copy,
              ),
              ProfileMenuTile(
                onTap: () {},
                title: "Email",
                value: "Sushil@gmail.com",
              ),
              ProfileMenuTile(
                onTap: () {},
                title: "Phone number",
                value: "9825157838",
              ),
              ProfileMenuTile(
                onTap: () {},
                title: "Gender",
                value: "Male",
              ),
              ProfileMenuTile(
                onTap: () {},
                title: "Date of Birth",
                value: "10 Oct, 1994",
              ),
              const CustomDivider(),
              Padding(
                  padding: const EdgeInsets.all(Sizes.defaultSpace),
                  child: TextButton(
                    child: Text("Deactivate Account",
                        style: Theme.of(context).textTheme.bodyLarge!.apply(
                              color: Colors.red,
                            )),
                    onPressed: () {},
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
