import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_store/common/shimmer/category_shimmer_effect.dart';
import 'package:s_store/featues/shop/controllers/category_controller.dart';
import 'package:s_store/featues/shop/screens/home/widgets/vertical_image_text.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/constants/sizes.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    final dark = Theme.of(context).brightness == Brightness.dark;

    return Obx(() {
      if (controller.isLoading.value) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizes.defaultSpace),
          child: CategoryShimmerEffect(),
        );
      }
      if (controller.featuredCategories.isEmpty) {
        return const Center(
          child: Text("No data found", style: TextStyle(color: Colors.red)),
        );
      }

      return GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.spaceBtwItems),
          child: SizedBox(
            height: 80,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: controller.featuredCategories.length,
                itemBuilder: (BuildContext context, int index) {
                  final category = controller.featuredCategories[index];
                  return VerticalImageText(
                      backgroundColor: dark
                          ? CColors.darkGrey.withOpacity(0.3)
                          : CColors.light,
                      imageUrl: category.image,
                      title: category.name);
                }),
          ),
        ),
      );
    });
  }
}
