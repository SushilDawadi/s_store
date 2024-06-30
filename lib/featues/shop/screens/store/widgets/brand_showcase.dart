import 'package:flutter/material.dart';
import 'package:s_store/common/rounded_container.dart';
import 'package:s_store/featues/shop/screens/store/widgets/brand_card.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/helpers/helper_functions.dart';

class BrandShowCase extends StatelessWidget {
  const BrandShowCase({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      showborder: true,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(Sizes.md),
      margin: const EdgeInsets.only(bottom: Sizes.spaceBtwItems),
      child: Column(
        children: [
          const CustomBrandCard(showBorder: false, image: Images.sport),
          Row(
              children: images
                  .map((image) => buildTopProductImages(image, context))
                  .toList())
        ],
      ),
    );
  }
}

Widget buildTopProductImages(String image, context) {
  return Expanded(
    child: CustomRoundedContainer(
      height: 100,
      margin: const EdgeInsets.only(right: Sizes.sm),
      padding: const EdgeInsets.all(Sizes.md),
      backgroundColor: HelperFunctions.isDarkMode(context)
          ? CColors.darkerGrey.withOpacity(0.3)
          : CColors.light.withOpacity(0.5),
      child: Image(
        fit: BoxFit.contain,
        image: AssetImage(image),
      ),
    ),
  );
}
