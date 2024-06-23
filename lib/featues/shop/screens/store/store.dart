import 'package:flutter/material.dart';
import 'package:s_store/common/common.widgets/appbar/appbar.dart';
import 'package:s_store/common/common.widgets/cart_counter.dart';
import 'package:s_store/common/common.widgets/grid_view_layout.dart';
import 'package:s_store/common/common.widgets/heading.dart';
import 'package:s_store/common/common.widgets/images/circular_image.dart';
import 'package:s_store/common/common.widgets/product/brand_title_with_verify.dart';
import 'package:s_store/common/common.widgets/rounded_container.dart';
import 'package:s_store/common/search_bar.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/enums.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/helpers/helper_functions.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          showBackArrow: false,
          title:
              Text('Store', style: Theme.of(context).textTheme.headlineMedium),
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
                expandedHeight: 440,
                backgroundColor: HelperFunctions.isDarkMode(context)
                    ? CColors.dark
                    : CColors.white,
                flexibleSpace: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(Sizes.defaultSpace),
                  children: [
                    CustomSearchBar(
                      text: "Search in Store",
                      onTap: () {},
                      showBackground: false,
                      showBorder: true,
                    ),
                    const SizedBox(height: Sizes.spaceBtwSections),
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
                          return GestureDetector(
                            onTap: () {},
                            child: CustomRoundedContainer(
                              padding: const EdgeInsets.all(Sizes.sm),
                              showborder: true,
                              backgroundColor: Colors.transparent,
                              child: Row(
                                children: [
                                  Flexible(
                                    child: CustomCircularImage(
                                      image: Images.sport,
                                      backgroundColor: Colors.transparent,
                                      overlayColor:
                                          HelperFunctions.isDarkMode(context)
                                              ? CColors.white
                                              : CColors.dark,
                                    ),
                                  ),
                                  const SizedBox(
                                      width: Sizes.spaceBtwItems / 2),
                                  //details
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const BrandTitleAndVerifyIcon(
                                          text: "Nike",
                                          textSize: TextSize.large,
                                        ),
                                        Text("256 Productsdsaaaaaaaaadsaaaaaa",
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium),
                                      ],
                                    ),
                                  )
                                ],
                              ),

                              //details
                            ),
                          );
                        })
                  ],
                ),
              ),
            ];
          },
          body: Container(),
        ));
  }
}
