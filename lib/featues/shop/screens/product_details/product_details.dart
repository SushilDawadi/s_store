import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:s_store/common/button.dart';
import 'package:s_store/common/common.widgets/bottom_bar/add_to_cart_bar.dart';
import 'package:s_store/common/heading.dart';
import 'package:s_store/common/common.widgets/product/brand_title_with_verify.dart';
import 'package:s_store/common/common.widgets/divider/divider.dart';
import 'package:s_store/featues/shop/screens/product_details/choice_chip.dart';

import 'package:s_store/featues/shop/screens/product_details/price_tag.dart';
import 'package:s_store/featues/shop/screens/product_details/sale_tag.dart';
import 'package:s_store/featues/shop/screens/product_details/product_image_slider.dart';
import 'package:s_store/featues/shop/screens/product_details/rating_share.dart';
import 'package:s_store/featues/shop/screens/product_details/variation_continaer.dart';
import 'package:s_store/featues/shop/screens/product_reviews/product_reviews.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/enums.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/constants/sizes.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: dark ? CColors.dark : CColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Product Image Slider
            const ProductImageSilder(),

            //Product Details
            Padding(
              padding: const EdgeInsets.only(
                  bottom: Sizes.defaultSpace,
                  left: Sizes.defaultSpace,
                  right: Sizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Rating and share button
                  const RatingAndShare(),

                  //Price , title , stock and brand
                  const Row(
                    children: [
                      CustomSaleTag(),
                      SizedBox(
                        width: Sizes.md,
                      ),
                      CustomPriceTag(
                        price: "175",
                        isLarge: false,
                      ),
                      SizedBox(
                        width: Sizes.md,
                      ),
                      CustomPriceTag(
                        price: "200",
                        isLarge: true,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: Sizes.sm,
                  ),
                  Text(
                    "Headphone with mic",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    height: Sizes.sm,
                  ),
                  Row(
                    children: [
                      Text(
                        "Status",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(
                        width: Sizes.sm,
                      ),
                      Text(
                        "In Stock",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .apply(fontWeightDelta: 2),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: Sizes.md,
                  ),
                  const Row(
                    children: [
                      Image(
                        image: AssetImage(Images.product2),
                        height: 32,
                        width: 32,
                      ),
                      SizedBox(
                        width: Sizes.sm,
                      ),
                      BrandTitleAndVerifyIcon(
                        text: "Nike",
                        textSize: TextSize.large,
                      ),
                    ],
                  ),
                  //variation Container
                  const SizedBox(
                    height: Sizes.sm,
                  ),
                  const VariationContainer(),

                  Column(
                    children: [
                      Wrap(
                        spacing: 8,
                        children: [
                          CustomHeading(
                            text: "Colors",
                            showButton: false,
                            color: dark ? CColors.white : CColors.black,
                          ),
                          CustomChoiceChip(
                            text: "green",
                            isSelected: true,
                            onSelected: (value) {},
                          ),
                          CustomChoiceChip(
                            text: "red",
                            isSelected: false,
                            onSelected: (value) {},
                          ),
                          CustomChoiceChip(
                            text: "yellow",
                            isSelected: true,
                            onSelected: (value) {},
                          ),
                          CustomChoiceChip(
                            text: "green",
                            isSelected: true,
                            onSelected: (value) {},
                          ),
                          CustomChoiceChip(
                            text: "red",
                            isSelected: false,
                            onSelected: (value) {},
                          ),
                          CustomChoiceChip(
                            text: "yellow",
                            isSelected: true,
                            onSelected: (value) {},
                          ),
                          CustomChoiceChip(
                            text: "green",
                            isSelected: true,
                            onSelected: (value) {},
                          ),
                          CustomChoiceChip(
                            text: "red",
                            isSelected: false,
                            onSelected: (value) {},
                          ),
                          CustomChoiceChip(
                            text: "yellow",
                            isSelected: true,
                            onSelected: (value) {},
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CustomHeading(
                        text: "Size",
                        showButton: false,
                        color: dark ? CColors.white : CColors.black,
                      ),
                      Wrap(
                        spacing: 6,
                        children: [
                          CustomChoiceChip(
                            text: "EU 34",
                            isSelected: true,
                            onSelected: (value) {},
                          ),
                          CustomChoiceChip(
                            text: "EU 36",
                            isSelected: false,
                            onSelected: (value) {},
                          ),
                          CustomChoiceChip(
                            text: "EU 38",
                            isSelected: false,
                            onSelected: (value) {},
                          ),
                          CustomChoiceChip(
                            text: "EU 34",
                            isSelected: true,
                            onSelected: (value) {},
                          ),
                          CustomChoiceChip(
                            text: "EU 36",
                            isSelected: false,
                            onSelected: (value) {},
                          ),
                          CustomChoiceChip(
                            text: "EU 38",
                            isSelected: false,
                            onSelected: (value) {},
                          ),
                          CustomChoiceChip(
                            text: "EU 34",
                            isSelected: true,
                            onSelected: (value) {},
                          ),
                          CustomChoiceChip(
                            text: "EU 36",
                            isSelected: false,
                            onSelected: (value) {},
                          ),
                          CustomChoiceChip(
                            text: "EU 38",
                            isSelected: false,
                            onSelected: (value) {},
                          ),
                        ],
                      )
                    ],
                  ),
                  // Check Out Button
                  const SizedBox(
                    height: Sizes.md,
                  ),
                  CustomButton(
                      text: "Checkout", onPressed: () {}, isFilled: true),
                  const SizedBox(height: Sizes.sm),
                  CustomHeading(
                    text: "Description",
                    showButton: false,
                    color: dark ? CColors.white : CColors.black,
                  ),
                  const ReadMoreText(
                    trimCollapsedText: '...Show more',
                    trimExpandedText: ' Show less',
                    trimMode: TrimMode.Length,
                    trimLength: 100,
                    "The is the product description for The is the product description for The is the product description for The is the product description for The is the product description for ",
                  ),
                  const CustomDivider(
                    padding: EdgeInsets.only(top: Sizes.defaultSpace / 2),
                  ),
                  const SizedBox(
                    height: Sizes.defaultSpace,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomHeading(
                        color: dark ? CColors.white : CColors.black,
                        text: "Reviews(199)",
                        showButton: false,
                      ),
                      IconButton(
                          onPressed: () {
                            Get.to(() => const ProductReviews());
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: Sizes.iconSm,
                          ))
                    ],
                  )
                ],
              ),
            ),

            //price,Title,Stock and Brand
          ],
        ),
      ),
      bottomNavigationBar: const AddToCartBar(),
    );
  }
}
