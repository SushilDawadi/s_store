import 'package:flutter/material.dart';
import 'package:s_store/common/common.widgets/images/circular_image.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/sizes.dart';

class VerticalImageText extends StatelessWidget {
  const VerticalImageText(
      {super.key,
      this.textColor = Colors.white,
      required this.imageUrl,
      required this.title,
      this.backgroundColor,
      this.isNetworkImage = true,
      this.onTap});

  final Color textColor;
  final String imageUrl, title;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: Sizes.spaceBtwItems),
        child: Column(
          children: [
            CustomCircularImage(
              image: imageUrl,
              fit: BoxFit.fitWidth,
              padding: Sizes.sm * 1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: dark ? CColors.light : CColors.dark,
            ),
            const SizedBox(height: Sizes.sm / 2),
            Text(
              title,
              style: TextStyle(
                color: textColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
