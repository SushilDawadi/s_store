import 'package:flutter/material.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/device/device_utility.dart';
import 'package:s_store/utils/helpers/helper_functions.dart';

class CustomTabbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTabbar({super.key, required this.tabs});

  final List<Tab> tabs;
  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? CColors.dark : CColors.white,
      child: TabBar(
        tabAlignment: TabAlignment.start,
        tabs: tabs,
        isScrollable: true,
        indicatorColor: CColors.primary,
        indicatorPadding: EdgeInsets.zero,
        labelColor: dark ? CColors.white : CColors.dark,
        unselectedLabelColor: CColors.darkGrey,
        padding: EdgeInsets.zero,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(DeviceUtils.getAppBarHeight());
}
