import 'package:flutter/material.dart';
import 'package:s_store/common/common.widgets/appbar/appbar.dart';
import 'package:s_store/featues/shop/screens/cart/widgets/cart_image_details.dart';
import 'package:s_store/featues/shop/screens/cart/widgets/increment_decrement_cart.dart';
import 'package:s_store/featues/shop/screens/product_details/price_tag.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/sizes.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: dark ? CColors.dark : CColors.white,
      appBar: CustomAppBar(
        title: const Text("Cart"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: ListView.separated(
            separatorBuilder: (_, __) => const SizedBox(
              height: Sizes.md,
            ),
            itemCount: 5,
            itemBuilder: (context, index) {
              return const Column(
                children: [
                  CartImageDetails(),
                  SizedBox(
                    height: Sizes.defaultSpace,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IncrementDecrementCart(),
                      CustomPriceTag(isLarge: false, price: "256")
                    ],
                  )
                ],
              );
            },
          )),
    );
  }
}
