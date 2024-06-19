import 'package:flutter/material.dart';
import 'package:s_store/utils/constants/sizes.dart';

class RoundedCustomImage extends StatelessWidget {
  const RoundedCustomImage(
      {super.key,
      this.width,
      this.height = 180,
      required this.imageUrl,
      this.applyImageRadius = true,
      this.border,
      this.fit = BoxFit.fill,
      this.padding = const EdgeInsets.symmetric(horizontal: Sizes.md),
      this.isNetworkImage = false,
      this.onTap});

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final BoxFit? fit;
  final EdgeInsetsGeometry padding;
  final bool isNetworkImage;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap;
      },
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.md),
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(10)
              : BorderRadius.circular(0),
          child: Image(
            image:
                isNetworkImage ? NetworkImage(imageUrl) : AssetImage(imageUrl),
            fit: fit,
          ),
        ),
      ),
    );
  }
}
