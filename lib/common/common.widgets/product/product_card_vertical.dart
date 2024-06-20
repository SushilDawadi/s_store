import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/common/common.widgets/circular_icon.dart';
import 'package:s_store/common/common.widgets/design/shadows.dart';
import 'package:s_store/common/common.widgets/product/product_title_text.dart';
import 'package:s_store/common/common.widgets/rounded_container.dart';
import 'package:s_store/common/common.widgets/rounded_image.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/constants/sizes.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [CustomShadow.verticalProductShadow],
          borderRadius: BorderRadius.circular(Sizes.productItemRadius),
          color: dark ? CColors.darkerGrey : CColors.white,
        ),
        child: Column(
          children: [
            CustomRoundedContainer(
              backgroundColor: dark
                  ? CColors.dark.withOpacity(0.5)
                  : CColors.light.withOpacity(0.5),
              height: 180,
              padding: const EdgeInsets.all(Sizes.sm),
              child: Stack(
                children: [
                  const RoundedCustomImage(
                    imageUrl: Images.product1,
                    applyImageRadius: true,
                  ),

                  //sale tag
                  Positioned(
                    top: 8,
                    child: CustomRoundedContainer(
                      radius: Sizes.sm,
                      backgroundColor: Colors.yellow.withOpacity(0.7),
                      padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.sm,
                        vertical: Sizes.sm,
                      ),
                      child: Text(
                        '25%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: CColors.black),
                      ),
                    ),
                  ),
                  //favorite icon
                  Positioned(
                    top: 0,
                    right: 0,
                    child: CustomCircularIcon(
                      onPressed: () {},
                      icon: dark ? Iconsax.heart : Iconsax.heart5,
                      color: dark ? CColors.white : Colors.red,
                      backgroundColor:
                          dark ? Colors.transparent : CColors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: Sizes.sm, top: Sizes.xxs),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProductTitleText(
                    text: 'Green Nike Air Shoes',
                    smallSize: true,
                  ),
                  const SizedBox(height: Sizes.sm),
                  Row(
                    children: [
                      Text(
                        'Nike',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(width: Sizes.xs),
                      const Icon(
                        Iconsax.verify5,
                        color: CColors.primary,
                        size: Sizes.iconSm,
                      ),
                    ],
                  ),
                  const SizedBox(height: Sizes.md),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$35.5',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: CColors.dark,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Sizes.borderRadiusLg),
                              bottomRight:
                                  Radius.circular(Sizes.borderRadiusLg)),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Iconsax.add),
                          color: CColors.white,
                          iconSize: Sizes.iconLg,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
