import 'package:flutter/material.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/sizes.dart';

class CustomRoundedContainer extends StatelessWidget {
  const CustomRoundedContainer(
      {super.key,
      this.height,
      this.width,
      this.backgroundColor = CColors.white,
      this.radius = Sizes.cardRadiusLg,
      this.child,
      this.padding,
      this.margin,
      this.borderColor = CColors.borderPrimary,
      this.showborder = false});

  final double? height;
  final double? width;
  final Color backgroundColor;
  final double radius;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color borderColor;
  final bool showborder;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
        border: showborder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
