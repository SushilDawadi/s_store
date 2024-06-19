import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_store/common/common.widgets/design/circular_design_container.dart';
import 'package:s_store/common/common.widgets/rounded_image.dart';
import 'package:s_store/featues/shop/controllers/home_controller.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/sizes.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({super.key, required this.banners});

  final List<String> banners;
  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          items:
              banners.map((url) => RoundedCustomImage(imageUrl: url)).toList(),
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, reason) =>
                homeController.updateIndicator(index),
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
              for (int i = 0; i < 3; i++)
                CircularDesignContainer(
                  margin: const EdgeInsets.all(Sizes.sm / 2),
                  backgroundColor: homeController.currentIndex.value == i
                      ? CColors.primary
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
}
