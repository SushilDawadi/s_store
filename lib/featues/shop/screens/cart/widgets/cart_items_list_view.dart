import 'package:flutter/material.dart';
import 'package:s_store/featues/shop/screens/cart/widgets/cart_image_details.dart';
import 'package:s_store/featues/shop/screens/cart/widgets/increment_decrement_cart.dart';
import 'package:s_store/featues/shop/screens/product_details/price_tag.dart';
import 'package:s_store/utils/constants/sizes.dart';

class CartItemsListView extends StatelessWidget {
  const CartItemsListView({super.key, this.showButtonAndPrice = true});
  final bool showButtonAndPrice;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(
        height: Sizes.md,
      ),
      itemCount: 2,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          children: [
            const CartImageDetails(),
            if (showButtonAndPrice)
              const SizedBox(
                height: Sizes.defaultSpace,
              ),
            if (showButtonAndPrice)
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IncrementDecrementCart(),
                  CustomPriceTag(isLarge: false, price: "256")
                ],
              )
          ],
        );
      },
    );
  }
}
