import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/common/circular_icon.dart';
import 'package:s_store/common/common.widgets/design/shadows.dart';
import 'package:s_store/common/common.widgets/product/brand_title_with_verify.dart';
import 'package:s_store/common/common.widgets/product/product_title_text.dart';
import 'package:s_store/common/rounded_container.dart';
import 'package:s_store/common/rounded_image.dart';
import 'package:s_store/featues/shop/screens/product_details/price_tag.dart';
import 'package:s_store/featues/shop/screens/product_details/sale_tag.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/constants/sizes.dart';

class ProductHorizontalCard extends StatelessWidget {
  const ProductHorizontalCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: 310,
      padding: const EdgeInsets.only(
          top: 8.0, left: Sizes.sm, right: Sizes.sm, bottom: Sizes.xs),
      decoration: BoxDecoration(
        boxShadow: [CustomShadow.verticalProductShadow],
        borderRadius: BorderRadius.circular(Sizes.productItemRadius),
        color: dark ? CColors.darkerGrey : CColors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 0,
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
                        height: 120,
                        imageUrl: Images.product1,
                        applyImageRadius: true,
                      ),

                      //sale tag
                      const Positioned(child: CustomSaleTag()),
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
                )
              ],
            ),
          ),
          const SizedBox(
            width: Sizes.spaceBtwItems,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: Sizes.sm),
                  child: ProductTitleText(
                    text: "Green Nike Half Sleeves shirt ",
                    smallSize: false,
                  ),
                ),
                const SizedBox(
                  height: Sizes.xs,
                ),
                const BrandTitleAndVerifyIcon(text: "Nike"),
                const SizedBox(
                  height: Sizes.md,
                ),
                Row(
                  children: [
                    const CustomPriceTag(isLarge: false, price: "256"),
                    const Spacer(),
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
