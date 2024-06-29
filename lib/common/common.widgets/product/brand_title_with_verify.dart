import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/common/common.widgets/product/brand_title_text.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/enums.dart';

import 'package:s_store/utils/constants/sizes.dart';

class BrandTitleAndVerifyIcon extends StatelessWidget {
  const BrandTitleAndVerifyIcon({
    super.key,
    required this.text,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
    this.textColor,
    this.iconColor = CColors.minimalText,
    this.textSize = TextSize.small,
  });

  final String text;
  final int maxLines;
  final TextOverflow overflow;
  final Color? textColor, iconColor;
  final TextSize textSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
            child: BrandTitleText(
          title: text,
          textColor: textColor,
          maxLines: maxLines,
          textSize: textSize,
        )),
        const SizedBox(width: Sizes.xs),
        Icon(
          Iconsax.verify5,
          color: iconColor,
          size: Sizes.iconSm,
        ),
      ],
    );
  }
}
