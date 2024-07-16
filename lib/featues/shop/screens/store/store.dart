import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_store/common/common.widgets/appbar/appbar.dart';
import 'package:s_store/common/common.widgets/appbar/tabbar.dart';
import 'package:s_store/common/cart_counter.dart';
import 'package:s_store/common/grid_view_layout.dart';
import 'package:s_store/common/heading.dart';
import 'package:s_store/common/search_bar.dart';
import 'package:s_store/featues/shop/controllers/category_controller.dart';
import 'package:s_store/featues/shop/screens/all_brands/all_brands.dart';
import 'package:s_store/featues/shop/screens/cart/cart.dart';
import 'package:s_store/featues/shop/screens/store/widgets/brand_card.dart';
import 'package:s_store/featues/shop/screens/store/widgets/category_tab.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/helpers/helper_functions.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      animationDuration: Durations.extralong4,
      length: categories.length,
      child: Scaffold(
          backgroundColor: HelperFunctions.isDarkMode(context)
              ? CColors.dark
              : CColors.white,
          appBar: CustomAppBar(
            showBackArrow: false,
            title: Text('Store',
                style: Theme.of(context).textTheme.headlineMedium),
            actions: [
              CustomCartCounter(
                onTap: () {
                  Get.to(() => Cart());
                },
                iconColor: HelperFunctions.isDarkMode(context)
                    ? CColors.white
                    : CColors.dark,
              )
            ],
          ),
          body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  expandedHeight: 420,
                  backgroundColor: HelperFunctions.isDarkMode(context)
                      ? CColors.dark
                      : CColors.white,
                  flexibleSpace: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(Sizes.defaultSpace),
                    children: [
                      // SizedBox(height: Sizes.spaceBtwSections),
                      CustomSearchBar(
                        text: "Search in Store",
                        onTap: () {},
                        showBackground: false,
                        showBorder: true,
                      ),
                      const SizedBox(height: Sizes.spaceBtwItems),
                      //feature heading
                      CustomHeading(
                        color: HelperFunctions.isDarkMode(context)
                            ? CColors.white
                            : CColors.dark,
                        text: "Featured Brands",
                        showButton: true,
                        onPressed: () {
                          Get.to(() => const AllBrands());
                        },
                        buttonTitle: "View All",
                      ),
                      const SizedBox(height: Sizes.spaceBtwItems),

                      GridViewLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          return const CustomBrandCard(
                            showBorder: true,
                            image: Images.sport,
                          );
                        },
                      ),
                    ],
                  ),
                  bottom: CustomTabbar(
                    tabs: categories
                        .map((category) => Tab(
                              text: category.name,
                            ))
                        .toList(),
                  ),
                ),
              ];
            },
            body: TabBarView(children: [
              //--brands
              for (final category in categories)
                CategoryTab(
                  category: category,
                ),
              //--products
            ]),
          )),
    );
  }
}
