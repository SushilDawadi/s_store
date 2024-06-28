import 'package:flutter/material.dart';

import 'package:s_store/featues/shop/screens/product_details/price_tag.dart';
import 'package:s_store/featues/shop/screens/product_details/sale_tag.dart';
import 'package:s_store/featues/shop/screens/product_details/product_image_slider.dart';
import 'package:s_store/featues/shop/screens/product_details/rating_share.dart';
import 'package:s_store/utils/constants/colors.dart';
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
            ProductImageSilder(),

            //Product Details
            Padding(
              padding: EdgeInsets.only(
                  bottom: Sizes.defaultSpace,
                  left: Sizes.defaultSpace,
                  right: Sizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Rating and share button
                  RatingAndShare(),

                  //Price , title , stock and brand
                  Row(
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
                  SizedBox(
                    height: Sizes.sm,
                  ),
                  Text(
                    "Headphone with mic",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ),

            //price,Title,Stock and Brand
          ],
        ),
      ),
    );
  }
}
