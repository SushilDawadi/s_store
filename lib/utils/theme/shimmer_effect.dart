import 'package:flutter/material.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

class CShimmerEffect extends StatelessWidget {
  const CShimmerEffect({
    super.key,
    this.color,
    required this.height,
    required this.width,
    this.radius = 15,
  });

  final Color? color;
  final double height, width, radius;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Shimmer.fromColors(
      baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color ?? (dark ? CColors.darkerGrey : CColors.lightGrey),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
