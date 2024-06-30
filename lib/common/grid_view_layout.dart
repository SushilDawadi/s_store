import 'package:flutter/material.dart';
import 'package:s_store/utils/constants/sizes.dart';

class GridViewLayout extends StatelessWidget {
  const GridViewLayout(
      {super.key,
      required this.itemCount,
      this.crossAxisSpacing = Sizes.defaultSpace,
      this.mainAxisSpacing = Sizes.defaultSpace,
      this.mainAxisExtent = 288,
      required this.itemBuilder,
      this.shrinkWrap = true,
      this.physics = true,
      this.crossAxisCount = 2,
      this.child});

  final int itemCount;
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final double mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;
  final bool shrinkWrap;
  final bool physics;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: itemCount,
        physics: physics ? const NeverScrollableScrollPhysics() : null,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
          mainAxisExtent: mainAxisExtent,
        ),
        itemBuilder: itemBuilder);
  }
}
