import 'package:flutter/material.dart';
import 'package:s_store/utils/constants/colors.dart';

class CustomShadow {
  static final verticalProductShadow = BoxShadow(
      color: CColors.darkGrey.withOpacity(0.1),
      offset: const Offset(0, 2),
      blurRadius: 50,
      spreadRadius: 7);

  static final horizontalProductShadow = BoxShadow(
      color: CColors.darkGrey.withOpacity(0.1),
      offset: const Offset(0, 2),
      blurRadius: 50,
      spreadRadius: 7);
}
