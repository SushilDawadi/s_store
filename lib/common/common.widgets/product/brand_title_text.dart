import 'package:flutter/material.dart';
import 'package:s_store/utils/constants/enums.dart';

class BrandTitleText extends StatelessWidget {
  const BrandTitleText({
    super.key,
    this.maxLines = 1,
    this.textColor,
    required this.title,
    this.textSize = TextSize.small,
    this.textAlign = TextAlign.center,
  });

  final int maxLines;
  final Color? textColor;
  final String title;
  final TextSize textSize;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      style: textSize == TextSize.small
          ? Theme.of(context).textTheme.labelMedium!.apply(color: textColor)
          : textSize == TextSize.medium
              ? Theme.of(context).textTheme.bodyLarge!.apply(color: textColor)
              : textSize == TextSize.large
                  ? Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .apply(color: textColor)
                  : Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: textColor),
    );
  }
}
