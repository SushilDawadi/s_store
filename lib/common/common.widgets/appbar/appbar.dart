import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/helpers/helper_functions.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;
  final IconData? leadingIcon;
  final bool? showBackArrow;
  final VoidCallback? onLeadingIconPressed;

  CustomAppBar(
      {super.key,
      this.title,
      this.actions,
      this.leadingIcon,
      this.showBackArrow = true,
      this.onLeadingIconPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow!
            ? IconButton(
                icon: const Icon(Iconsax.arrow_left),
                onPressed: () {
                  Get.back();
                },
              )
            : leadingIcon != null
                ? IconButton(
                    icon: Icon(leadingIcon),
                    onPressed: onLeadingIconPressed,
                  )
                : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  final Size preferredSize = Size.fromHeight(HelperFunctions.getAppBarHeight());
}
