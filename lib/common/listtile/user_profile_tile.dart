import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/common/common.widgets/images/circular_image.dart';
import 'package:s_store/featues/personalization/screens/settings/user_profile.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/image_strings.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CustomCircularImage(
        image: Images.profileImage,
        width: 60,
        height: 60,
        fit: BoxFit.cover,
        padding: 0,
      ),
      title: Text(
        'Sushil Dawadi',
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: CColors.white),
      ),
      subtitle: Text(
        'Sushildawadi14@gmail.com',
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: CColors.white),
      ),
      trailing: IconButton(
        onPressed: () {
          Get.to(() => const UserProfile());
        },
        icon: const Icon(Iconsax.edit),
        color: CColors.white,
      ),
    );
  }
}
