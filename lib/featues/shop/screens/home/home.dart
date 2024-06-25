import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/common/common.widgets/appbar/appbar.dart';
import 'package:s_store/common/common.widgets/cart_counter.dart';
import 'package:s_store/common/common.widgets/design/circular_design_container.dart';
import 'package:s_store/common/common.widgets/design/curved_edge_widget.dart';
import 'package:s_store/common/common.widgets/design/curved_edges.dart';
import 'package:s_store/common/common.widgets/design/custom_child_header.dart';
import 'package:s_store/common/common.widgets/grid_view_layout.dart';
import 'package:s_store/common/common.widgets/heading.dart';
import 'package:s_store/common/common.widgets/product/product_card_vertical.dart';
import 'package:s_store/common/search_bar.dart';
import 'package:s_store/featues/shop/controllers/home_controller.dart';
import 'package:s_store/featues/shop/screens/home/widgets/carousel_slider.dart';
import 'package:s_store/featues/shop/screens/home/widgets/category_view.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/constants/text_Strings.dart';
import 'package:s_store/utils/helpers/helper_functions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
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
                            Text(
                              'Sushil Dawadi',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .apply(color: CColors.light),
                            )
                          ],
                        ),
                        actions: const [CustomCartCounter()],
                      ),

                      // search bar
                      const SizedBox(
                        height: Sizes.spaceBtwItems,
                      ),
                      CustomSearchBar(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.defaultSpace),
                        onTap: () {},
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
                      const CategoryView(),
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
                  const CustomCarouselSlider(
                    banners: [Images.banner1, Images.banner2, Images.banner3],
                  ),
                  //heading text
                  CustomHeading(
                    color: HelperFunctions.isDarkMode(context)
                        ? CColors.white
                        : CColors.dark,
                    text: "Popular Products",
                    showButton: true,
                    onPressed: () {},
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
  }
}
