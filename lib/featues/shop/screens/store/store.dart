import 'package:flutter/material.dart';
import 'package:s_store/common/common.widgets/appbar/appbar.dart';
import 'package:s_store/common/common.widgets/cart_counter.dart';
import 'package:s_store/common/search_bar.dart';
import 'package:s_store/utils/constants/colors.dart';
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
                  children: [
                    CustomSearchBar(
                      padding: EdgeInsets.symmetric(
                          horizontal: Sizes.defaultSpace,
                          vertical: Sizes.spaceBtwSections),
                      text: "Search in Store",
                      onTap: () {},
                      showBackground: false,
                      showBorder: true,
                    )
                  ],
                ),
              ),
            ];
          },
          body: Container(),
        ));
  }
}
