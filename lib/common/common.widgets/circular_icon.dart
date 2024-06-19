import 'package:flutter/material.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/helpers/helper_functions.dart';

class CustomCircularIcon extends StatelessWidget {
  const CustomCircularIcon(
      {super.key,
      this.height,
      this.width,
      this.backgroundColor,
      required this.icon,
      this.onPressed,
      this.size = Sizes.lg,
      this.color});

  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? color;
  final IconData icon;
  final VoidCallback? onPressed;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor ??
            (HelperFunctions.isDarkMode(context)
                ? CColors.dark.withOpacity(0.9)
                : CColors.white.withOpacity(0.9)),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        icon: Icon(
          icon,
          size: size,
          color: color,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
