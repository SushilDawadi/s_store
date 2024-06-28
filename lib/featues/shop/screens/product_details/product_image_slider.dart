import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/common/common.widgets/appbar/appbar.dart';
import 'package:s_store/common/common.widgets/design/curved_edge_widget.dart';
import 'package:s_store/common/common.widgets/rounded_image.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/constants/sizes.dart';

class ProductImageSilder extends StatelessWidget {
  const ProductImageSilder({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return CurvedEdgeWidget(
      child: Container(
        color: dark ? CColors.darkerGrey : CColors.lighterGrey,
        child: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: Sizes.defaultSpace),
              child: Center(
                child: Image(
                  height: 400,
                  image: AssetImage(Images.product2),
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              right: 0,
              left: Sizes.defaultSpace,
              child: SizedBox(
                height: 75,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (_, __) => const SizedBox(
                    width: Sizes.md,
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return RoundedCustomImage(
                      backgroundColor:
                          dark ? CColors.darkerGrey : CColors.lighterGrey,
                      imageUrl: Images.product2,
                      padding: const EdgeInsets.all(Sizes.sm),
                      border: Border.all(color: CColors.secondary, width: 2),
                    );
                  },
                ),
              ),
            ),
            CustomAppBar(
              actions: const [Icon(Iconsax.heart5)],
            ),
          ],
        ),
      ),
    );
  }
}
