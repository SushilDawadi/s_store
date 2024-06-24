import 'package:flutter/material.dart';
import 'package:s_store/common/common.widgets/grid_view_layout.dart';
import 'package:s_store/common/common.widgets/heading.dart';
import 'package:s_store/common/common.widgets/product/product_card_vertical.dart';
import 'package:s_store/featues/shop/screens/store/widgets/brand_showcase.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/constants/sizes.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          Padding(
            padding: EdgeInsets.all(Sizes.defaultSpace),
            child: Column(
              children: [
                //brand
                BrandShowCase(images: [
                  Images.product1,
                  Images.product2,
                  Images.product3
                ]),

                //products
                //heading you might like
                CustomHeading(
                  text: "You Might like",
                  showButton: true,
                  buttonTitle: "View all",
                ),

                GridViewLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) {
                      return ProductCardVertical();
                    })
              ],
            ),
          ),
        ]);
  }
}
