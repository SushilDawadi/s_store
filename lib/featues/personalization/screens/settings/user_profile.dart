import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/common/common.widgets/appbar/appbar.dart';
import 'package:s_store/common/heading.dart';
import 'package:s_store/common/common.widgets/images/circular_image.dart';
import 'package:s_store/common/common.widgets/divider/divider.dart';
import 'package:s_store/data/repositories/user/user_repository.dart';
import 'package:s_store/featues/personalization/controllers/user_controller.dart';
import 'package:s_store/featues/personalization/screens/settings/widgets/profile_menu_tile.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/routes.dart';
import 'package:s_store/common/shimmer/shimmer_effect.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
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
              Obx(() {
                final networkImage = controller.user.value.profilePicture;
                final image = networkImage.isNotEmpty
                    ? networkImage
                    : Images.profileImage;
                return controller.imageLoading.value
                    ? const CShimmerEffect(
                        height: 55,
                        width: 55,
                        radius: 55,
                      )
                    : CustomCircularImage(
                        image: image,
                        fit: BoxFit.cover,
                        height: 90,
                        width: 90,
                        isNetworkImage: networkImage.isNotEmpty,
                      );
              }),
              TextButton(
                onPressed: () {
                  controller.uploadProfilePicture();
                },
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
                onTap: () {
                  Get.toNamed(GetRoutes.changeName);
                },
                title: "Name",
                value: controller.user.value.fullName,
              ),
              ProfileMenuTile(
                  onTap: () {},
                  title: "Username",
                  value: controller.user.value.username),
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
                value: controller.user.value.id,
                icon: Iconsax.copy,
              ),
              ProfileMenuTile(
                onTap: () {},
                title: "Email",
                value: controller.user.value.email,
              ),
              ProfileMenuTile(
                onTap: () {},
                title: "Phone number",
                value: controller.user.value.phoneNumber,
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
                    child: Text("Delete Account",
                        style: Theme.of(context).textTheme.bodyLarge!.apply(
                              color: Colors.red,
                            )),
                    onPressed: () {
                      controller.deleteWarningPopUp();
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
