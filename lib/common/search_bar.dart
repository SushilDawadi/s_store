import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/helpers/helper_functions.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.text,
    this.showBackground = true,
    required this.onTap,
    this.padding,
    this.showBorder = false,
  });

  final String text;
  final bool showBackground;
  final VoidCallback onTap;
  final EdgeInsetsGeometry? padding;
  final bool showBorder;
  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(0),
        child: Container(
          width: HelperFunctions.screenWidth(),
          decoration: BoxDecoration(
              color: showBackground
                  ? dark
                      ? CColors.dark
                      : CColors.white
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              border:
                  showBorder ? Border.all(color: CColors.lighterGrey) : null),
          child: Padding(
            padding: const EdgeInsets.all(Sizes.md),
            child: Row(
              children: [
                const Icon(
                  Iconsax.search_normal,
                ),
                const SizedBox(
                  width: Sizes.md,
                ),
                Text(
                  text,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
