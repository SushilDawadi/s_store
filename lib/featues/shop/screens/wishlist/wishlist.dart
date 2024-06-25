import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/common/common.widgets/appbar/appbar.dart';
import 'package:s_store/common/common.widgets/circular_icon.dart';
import 'package:s_store/common/common.widgets/grid_view_layout.dart';
import 'package:s_store/common/common.widgets/product/product_card_vertical.dart';
import 'package:s_store/featues/shop/screens/home/home.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/helpers/helper_functions.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          HelperFunctions.isDarkMode(context) ? CColors.dark : CColors.white,
      appBar: CustomAppBar(
        showBackArrow: false,
        title: Text(
          "WishList",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          CustomCircularIcon(
            icon: Iconsax.add,
            onPressed: () {
              Get.to(() => const HomeScreen());
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              GridViewLayout(
                  itemCount: 6,
                  itemBuilder: (_, index) {
                    return const ProductCardVertical();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
