import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_store/common/common.widgets/design/circular_design_container.dart';
import 'package:s_store/common/rounded_image.dart';
import 'package:s_store/common/shimmer/shimmer_effect.dart';
import 'package:s_store/featues/shop/controllers/banner_controller.dart';
import 'package:s_store/featues/shop/controllers/home_controller.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/sizes.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bannerController = Get.put(BannerController());
    return Obx(() {
      if (bannerController.isLoading.value)
        return const CShimmerEffect(height: 190, width: double.infinity);

      if (bannerController.banners.isEmpty) {
        return const Center(
          child: Text("No data found", style: TextStyle(color: Colors.red)),
        );
      } else {
        return Column(
          children: [
            CarouselSlider(
              items: bannerController.banners.map((banner) {
                return RoundedCustomImage(
                  imageUrl: banner.imageUrl,
                  isNetworkImage: true,
                  onTap: () => Get.toNamed(banner.targetScreen),
                );
              }).toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                autoPlay: true,
                onPageChanged: (index, reason) =>
                    bannerController.updateIndicator(index),
              ),
            ),
            const SizedBox(
              height: Sizes.spaceBtwItems,
            ),
            Center(
                child: Obx(
              () => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < bannerController.banners.length; i++)
                    CircularDesignContainer(
                      margin: const EdgeInsets.all(Sizes.sm / 2),
                      backgroundColor: bannerController.currentIndex.value == i
                          ? CColors.minimalText
                          : CColors.grey,
                      width: 20,
                      height: 4,
                    ),
                ],
              ),
            )),
          ],
        );
      }
    });
  }
}
