import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/common/common.widgets/appbar/appbar.dart';
import 'package:s_store/common/common.widgets/design/circular_design_container.dart';
import 'package:s_store/common/common.widgets/design/curved_edges.dart';
import 'package:s_store/common/common.widgets/heading.dart';
import 'package:s_store/common/search_bar.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/constants/text_Strings.dart';
import 'package:s_store/utils/helpers/helper_functions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          HelperFunctions.isDarkMode(context) ? CColors.dark : CColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: CustomCurvedEdges(),
              child: Container(
                color: CColors.primary,
                padding: const EdgeInsets.all(0),
                child: SizedBox(
                  height: 400,
                  child: Stack(
                    children: [
                      Positioned(
                        top: -150,
                        left: -250,
                        child: CircularDesignContainer(
                          backgroundColor: CColors.white.withOpacity(0.1),
                        ),
                      ),
                      Positioned(
                        top: 100,
                        left: -300,
                        child: CircularDesignContainer(
                          backgroundColor: CColors.white.withOpacity(0.1),
                        ),
                      ),
                      Positioned(
                        top: 100,
                        right: -300,
                        child: CircularDesignContainer(
                          backgroundColor: CColors.white.withOpacity(0.1),
                        ),
                      ),
                      // app bar
                      Column(
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
                            actions: [
                              Stack(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Iconsax.shopping_bag,
                                      color: CColors.white,
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    child: Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: CColors.dark,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "5",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge!
                                              .apply(color: CColors.white),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),

                          // search bar
                          const SizedBox(
                            height: Sizes.spaceBtwItems,
                          ),
                          const CustomSearchBar(
                            text: "Search for products...",
                            color: CColors.white,
                          ),

                          //headding text
                          const CustomHeading(text: "Popular Categories"),

                          SizedBox(
                            height: 70,
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (_, context) {
                                  return Container(
                                    width: 70,
                                    padding: EdgeInsets.all(Sizes.sm),
                                    decoration: BoxDecoration(
                                      color: CColors.white,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  );
                                }),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
