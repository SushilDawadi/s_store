import 'package:flutter/material.dart';
import 'package:s_store/common/shimmer/shimmer_effect.dart';
import 'package:s_store/utils/constants/sizes.dart';

class CategoryShimmerEffect extends StatelessWidget {
  const CategoryShimmerEffect({super.key, this.itemCount = 6});
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(
          width: Sizes.spaceBtwItems,
        ),
        itemBuilder: (_, __) => const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CShimmerEffect(
              width: 55,
              height: 55,
              radius: 55,
            ),
            SizedBox(
              height: Sizes.spaceBtwItems / 2,
            ),
            CShimmerEffect(
              width: 55,
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
