import 'package:flutter/material.dart';
import 'package:s_store/common/common.widgets/appbar/appbar.dart';
import 'package:s_store/common/common.widgets/appbar/tabbar.dart';
import 'package:s_store/common/cart_counter.dart';
import 'package:s_store/common/grid_view_layout.dart';
import 'package:s_store/common/heading.dart';
import 'package:s_store/common/search_bar.dart';
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
    return DefaultTabController(
      animationDuration: Durations.extralong4,
      length: 5,
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
                iconColor: HelperFunctions.isDarkMode(context)
                    ? CColors.dark
                    : CColors.white,
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
                          onPressed: () {},
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
                    bottom: const CustomTabbar(tabs: [
                      Tab(
                        child: Text('Sports'),
                      ),
                      Tab(
                        child: Text('Furniture'),
                      ),
                      Tab(
                        child: Text('Electronics'),
                      ),
                      Tab(
                        child: Text('Clothes'),
                      ),
                      Tab(
                        child: Text('Cosmetics'),
                      ),
                    ])),
              ];
            },
            body: const TabBarView(children: [
              //--brands
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
              //--products
            ]),
          )),
    );
  }
}
