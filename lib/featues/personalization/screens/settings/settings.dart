import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/common/common.widgets/appbar/appbar.dart';
import 'package:s_store/common/button.dart';
import 'package:s_store/common/common.widgets/design/curved_edge_widget.dart';
import 'package:s_store/common/common.widgets/design/custom_child_header.dart';
import 'package:s_store/common/common.widgets/listtile/settings_list_tile.dart';
import 'package:s_store/common/common.widgets/listtile/user_profile_tile.dart';
import 'package:s_store/common/heading.dart';
import 'package:s_store/common/common.widgets/divider/divider.dart';
import 'package:s_store/data/repositories/authentication/authentication_repositories.dart';
import 'package:s_store/featues/personalization/screens/addresses/address.dart';
import 'package:s_store/featues/shop/screens/orders/orders.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/helpers/helper_functions.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      backgroundColor:
          HelperFunctions.isDarkMode(context) ? CColors.dark : CColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CurvedEdgeWidget(
              child: CustomDesignHeader(
                child: Column(
                  children: [
                    CustomAppBar(
                      showBackArrow: false,
                      title: Text(
                        'Account',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .apply(color: CColors.white),
                      ),
                    ),
                    const SizedBox(
                      height: Sizes.sm,
                    ),

                    //profile card
                    const UserProfileTile(),
                    const SizedBox(
                      height: Sizes.spaceBtwSections,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.defaultSpace),
                  child: CustomHeading(
                      color: dark ? CColors.white : CColors.black,
                      text: "Account Settings ",
                      showButton: false),
                ),
                const CustomDivider(
                  padding: EdgeInsets.only(bottom: Sizes.md),
                ),
                CustomSettingListTile(
                  icon: Iconsax.home,
                  subtitle: "Set shopping delivery address",
                  title: "My Address",
                  onTap: () {
                    Get.to(() => const UserAddress());
                  },
                ),
                const CustomSettingListTile(
                  icon: Iconsax.shopping_cart,
                  subtitle: "Add,remove products and move to checkout ",
                  title: "My Cart",
                ),
                CustomSettingListTile(
                  icon: Iconsax.wallet,
                  subtitle: "Set shopping delivery address",
                  title: "My Orders",
                  onTap: () {
                    Get.to(() => const Orders());
                  },
                ),
                const CustomSettingListTile(
                  icon: Iconsax.bank,
                  subtitle: "withdraw balance to registered bank account",
                  title: "Bank Account",
                ),
                const CustomSettingListTile(
                  icon: Iconsax.discount_shape,
                  subtitle: "List of all discounted coupons",
                  title: "My Coupons",
                ),
                const CustomSettingListTile(
                  icon: Iconsax.notification,
                  subtitle: "set any kind of notification message",
                  title: "Notifications",
                ),
                const CustomSettingListTile(
                  icon: Iconsax.shield,
                  subtitle: "Manage data usage and connected accounts",
                  title: "Account Privacy",
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: Sizes.defaultSpace),
              child: CustomHeading(
                text: "App Settings ",
                showButton: false,
                color: dark ? CColors.white : CColors.black,
              ),
            ),
            const CustomDivider(
              padding: EdgeInsets.only(bottom: Sizes.md),
            ),
            const CustomSettingListTile(
              icon: Iconsax.document_upload,
              subtitle: "Upload Data to your Cloud firebase",
              title: "Load Data",
            ),
            CustomSettingListTile(
              icon: Iconsax.location_tick,
              subtitle: "set recommendation based on location",
              title: "Geo Location",
              trailing: Switch(value: true, onChanged: (value) {}),
            ),
            CustomSettingListTile(
              icon: Iconsax.security_safe,
              subtitle: "Search result is safe for all ages ",
              title: "Safe Mode",
              trailing: Switch(
                value: false,
                onChanged: (value) {},
              ),
            ),
            CustomSettingListTile(
              icon: Iconsax.image,
              subtitle: "Search result is safe for all ages ",
              title: "HD Image Quality",
              trailing: Switch(
                value: false,
                onChanged: (value) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Sizes.defaultSpace),
              child: CustomButton(
                  text: "LogOut",
                  onPressed: () {
                    AuthenticationRepository.instance.signOut();
                  },
                  isFilled: false),
            )
          ],
        ),
      ),
    );
  }
}
