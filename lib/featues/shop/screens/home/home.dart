import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_store/common/common.widgets/appbar/appbar.dart';
import 'package:s_store/common/cart_counter.dart';
import 'package:s_store/common/common.widgets/design/curved_edge_widget.dart';
import 'package:s_store/common/common.widgets/design/custom_child_header.dart';
import 'package:s_store/common/grid_view_layout.dart';
import 'package:s_store/common/heading.dart';
import 'package:s_store/common/common.widgets/product/product_card_vertical.dart';
import 'package:s_store/common/search_bar.dart';
import 'package:s_store/featues/personalization/controllers/user_controller.dart';
import 'package:s_store/featues/shop/controllers/home_controller.dart';
import 'package:s_store/featues/shop/screens/all_products/all_product.dart';
import 'package:s_store/featues/shop/screens/cart/cart.dart';
import 'package:s_store/featues/shop/screens/home/widgets/carousel_slider.dart';
import 'package:s_store/featues/shop/screens/home/widgets/category_view.dart';
import 'package:s_store/featues/shop/screens/sub_categories/sub_category.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/constants/text_Strings.dart';
import 'package:s_store/utils/helpers/helper_functions.dart';
import 'package:s_store/common/shimmer/shimmer_effect.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (controller) {
      final user = controller.user;
      return Scaffold(
        backgroundColor:
            HelperFunctions.isDarkMode(context) ? CColors.dark : CColors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              CurvedEdgeWidget(
                child: Container(
                  color: CColors.primary,
                  padding: const EdgeInsets.all(0),
                  child: CustomDesignHeader(
                    child: Column(
                      children: [
                        CustomAppBar(
                          showBackArrow: false,
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                TextStrings.appBarTitle,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .apply(color: CColors.light),
                              ),
                              Obx(() => controller.profileLoading.value
                                  ? const CShimmerEffect(
                                      height: 15,
                                      width: 80,
                                    )
                                  : Text(
                                      user != null ? user.value.fullName : "",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .apply(color: CColors.light),
                                    ))
                            ],
                          ),
                          actions: [
                            CustomCartCounter(
                              iconColor: Colors.white,
                              onTap: () => Get.to(() => const Cart()),
                            )
                          ],
                        ),

                        // search bar
                        const SizedBox(
                          height: Sizes.spaceBtwItems,
                        ),
                        CustomSearchBar(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Sizes.defaultSpace),
                          onTap: () {},
                          showBorder: true,
                          text: "Search for products...",
                        ),

                        //headding text
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Sizes.defaultSpace,
                              vertical: Sizes.defaultSpace / 2),
                          child: CustomHeading(
                            text: "Popular Categories",
                            showButton: false,
                          ),
                        ),

                        //category view
                        CategoryView(
                          onTap: () {
                            Get.to(() => const SubCategory());
                          },
                        ),
                        const SizedBox(height: Sizes.spaceBtwSections)
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: Sizes.defaultSpace),
                child: Column(
                  children: [
                    //custom carousel
                    const CustomCarouselSlider(),
                    //heading text
                    CustomHeading(
                      color: HelperFunctions.isDarkMode(context)
                          ? CColors.white
                          : CColors.dark,
                      text: "Popular Products",
                      showButton: true,
                      onPressed: () {
                        Get.to(() => const AllProduct());
                      },
                      buttonTitle: "View All",
                    ),
                    //product list

                    GridViewLayout(
                        itemCount: 2,
                        itemBuilder: (_, index) => const ProductCardVertical())
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
