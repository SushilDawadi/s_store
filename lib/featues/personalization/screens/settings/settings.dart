import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/common/common.widgets/appbar/appbar.dart';
import 'package:s_store/common/common.widgets/design/curved_edge_widget.dart';
import 'package:s_store/common/common.widgets/design/custom_child_header.dart';
import 'package:s_store/common/common.widgets/heading.dart';
import 'package:s_store/common/common.widgets/images/circular_image.dart';
import 'package:s_store/common/listtile/settings_list_tile.dart';
import 'package:s_store/common/listtile/user_profile_tile.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/helpers/helper_functions.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
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
                            .headlineSmall!
                            .apply(color: CColors.white),
                      ),
                    ),
                    const SizedBox(
                      height: Sizes.spaceBtwSections,
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
            const Padding(
              padding: EdgeInsets.all(Sizes.spaceBtwItems),
              child: Column(
                children: [
                  CustomHeading(text: "Account Settings ", showButton: false),
                  CustomSettingListTile(
                    icon: Iconsax.home,
                    subtitle: "Set shopping delivery address",
                    title: "My Address",
                  ),
                  CustomSettingListTile(
                    icon: Iconsax.home,
                    subtitle: "Set shopping delivery address",
                    title: "My Address",
                  ),
                  CustomSettingListTile(
                    icon: Iconsax.home,
                    subtitle: "Set shopping delivery address",
                    title: "My Address",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
