import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:s_store/common/common.widgets/rounded_container.dart';
import 'package:s_store/featues/shop/screens/product_details/price_tag.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/sizes.dart';

class VariationContainer extends StatelessWidget {
  const VariationContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return CustomRoundedContainer(
      padding: const EdgeInsets.all(Sizes.md),
      backgroundColor: dark ? CColors.darkerGrey : CColors.lighterGrey,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Variation",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                width: Sizes.sm,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text("Price: "),
                      CustomPriceTag(
                        isLarge: false,
                        price: "25",
                        decoration: TextDecoration.lineThrough,
                      ),
                      SizedBox(
                        width: Sizes.md,
                      ),
                      CustomPriceTag(isLarge: false, price: "25"),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Stock: "),
                      Text("In Stock",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .apply(fontWeightDelta: 2))
                    ],
                  ),
                ],
              )
            ],
          ),
          const ReadMoreText(
              trimCollapsedText: '...Show more',
              trimExpandedText: ' Show less',
              trimMode: TrimMode.Length,
              trimLength: 80,
              "This is the Description of the product and it wi This is the Description of the product and it wi This is the Description of the product and it wi This is the Description of the product and it wi")
        ],
      ),
    );
  }
}
