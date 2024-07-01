import 'package:flutter/material.dart';
import 'package:s_store/common/common.widgets/product/brand_title_with_verify.dart';
import 'package:s_store/common/common.widgets/product/product_title_text.dart';
import 'package:s_store/common/rounded_image.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/constants/sizes.dart';

class CartImageDetails extends StatelessWidget {
  const CartImageDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RoundedCustomImage(
          imageUrl: Images.product1,
          width: 60,
          height: 65,
          padding: const EdgeInsets.all(Sizes.sm),
          backgroundColor: dark ? CColors.darkGrey : CColors.lightGrey,
        ),
        const SizedBox(
          width: Sizes.md,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const BrandTitleAndVerifyIcon(text: "Nike"),
              const SizedBox(
                height: Sizes.sm,
              ),
              const Flexible(
                child: ProductTitleText(
                  text: "Black Sports Shoes",
                  maxLines: 1,
                  smallSize: false,
                ),
              ),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'Color ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: 'Green ',
                    style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(
                    text: 'Size ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: 'UK 08 ',
                    style: Theme.of(context).textTheme.bodyLarge),
              ]))
            ],
          ),
        )
      ],
    );
  }
}
