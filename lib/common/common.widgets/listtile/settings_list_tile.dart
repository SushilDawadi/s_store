import 'package:flutter/material.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/sizes.dart';

class CustomSettingListTile extends StatelessWidget {
  const CustomSettingListTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle,
      this.trailing,
      this.onTap});

  final IconData icon;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.md),
      child: ListTile(
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(fontSizeFactor: 1),
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        leading: Icon(
          icon,
          color: dark ? CColors.white : CColors.primary,
          size: Sizes.iconLg,
        ),
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }
}
