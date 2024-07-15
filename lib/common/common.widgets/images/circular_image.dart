import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/theme/shimmer_effect.dart';

class CustomCircularImage extends StatelessWidget {
  const CustomCircularImage({
    super.key,
    this.padding = Sizes.sm,
    this.backgroundColor,
    this.fit,
    this.isNetworkImage = false,
    this.height = 56,
    this.width = 56,
    required this.image,
    this.overlayColor,
  });
  final double height;
  final double width;
  final double padding;
  final Color? overlayColor;
  final Color? backgroundColor;
  final BoxFit? fit;
  final bool isNetworkImage;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: isNetworkImage
          ? ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CachedNetworkImage(
                imageUrl: image,
                fit: fit,
                color: overlayColor,
                progressIndicatorBuilder: (context, url, progress) =>
                    const CShimmerEffect(
                  height: 55,
                  width: 55,
                  radius: 55,
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            )
          : Image(
              fit: fit,
              color: overlayColor,
              image: isNetworkImage
                  ? NetworkImage(image)
                  : AssetImage(
                      image,
                    ),
            ),
    );
  }
}
