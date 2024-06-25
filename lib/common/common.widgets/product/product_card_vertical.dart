import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/common/common.widgets/circular_icon.dart';
import 'package:s_store/common/common.widgets/design/shadows.dart';
import 'package:s_store/common/common.widgets/product/brand_title_with_verify.dart';
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
        padding: const EdgeInsets.all(Sizes.xs),
        decoration: BoxDecoration(
          boxShadow: [CustomShadow.verticalProductShadow],
          borderRadius: BorderRadius.circular(Sizes.productItemRadius),
          color: dark ? CColors.darkerGrey : CColors.white,
        ),
        child: Column(
          children: [
            //product image and favorite icon
            CustomRoundedContainer(
              backgroundColor: dark
                  ? CColors.dark.withOpacity(0.5)
                  : CColors.light.withOpacity(0.5),
              padding: const EdgeInsets.all(Sizes.sm),
              child: Stack(
                children: [
                  const RoundedCustomImage(
                    imageUrl: Images.product1,
                    applyImageRadius: true,
                  ),

                  //sale tag
                  Positioned(
                    child: CustomRoundedContainer(
                      radius: Sizes.sm,
                      backgroundColor: Colors.yellow.withOpacity(0.9),
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
                    top: -10,
                    right: 0,
                    child: CustomCircularIcon(
                        onPressed: () {},
                        icon: Iconsax.heart5,
                        color: Colors.red,
                        backgroundColor: Colors.transparent),
                  ),
                ],
              ),
            ),
            //profile and brand name
            const Padding(
              padding: EdgeInsets.only(left: Sizes.sm, top: Sizes.md / 1.25),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductTitleText(
                      text: 'Gr',
                      smallSize: true,
                    ),
                    SizedBox(height: Sizes.xs),
                    BrandTitleAndVerifyIcon(
                      text: "Nike",
                      iconColor: Colors.blue,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),

            //price tag and add to cart button
            Padding(
              padding: const EdgeInsets.only(left: Sizes.sm),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$35.5',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: CColors.dark,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Sizes.borderRadiusLg),
                          bottomRight: Radius.circular(Sizes.borderRadiusLg)),
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
            ),
          ],
        ),
      ),
    );
  }
}
