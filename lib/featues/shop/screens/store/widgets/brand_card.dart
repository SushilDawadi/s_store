import 'package:flutter/material.dart';
import 'package:s_store/common/common.widgets/images/circular_image.dart';
import 'package:s_store/common/common.widgets/product/brand_title_with_verify.dart';
import 'package:s_store/common/rounded_container.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/enums.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/helpers/helper_functions.dart';

class CustomBrandCard extends StatelessWidget {
  const CustomBrandCard({
    super.key,
    required this.showBorder,
    required this.image,
    this.padding = const EdgeInsets.all(Sizes.sm),
    this.onPressed,
    this.brandTitle = "Nike",
    this.productCount = "256 Products",
  });

  final bool showBorder;
  final String image;
  final EdgeInsetsGeometry padding;
  final VoidCallbackAction? onPressed;
  final String brandTitle;
  final String productCount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: CustomRoundedContainer(
        padding: padding,
        showborder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            Flexible(
              child: CustomCircularImage(
                image: image,
                backgroundColor: Colors.transparent,
                overlayColor: HelperFunctions.isDarkMode(context)
                    ? CColors.white
                    : CColors.dark,
              ),
            ),
            const SizedBox(width: Sizes.spaceBtwItems / 2),
            //details
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BrandTitleAndVerifyIcon(
                    text: brandTitle,
                    textSize: TextSize.large,
                  ),
                  Text(productCount,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium),
                ],
              ),
            )
          ],
        ),

        //details
      ),
    );
  }
}
