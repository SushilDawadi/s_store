import 'package:flutter/material.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/helpers/helper_functions.dart';

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
        color:
            HelperFunctions.isDarkMode(context) ? CColors.dark : CColors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Image(
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
