import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_store/common/common.widgets/appbar/appbar.dart';
import 'package:s_store/featues/shop/screens/cart/widgets/cart_items_list_view.dart';
import 'package:s_store/featues/shop/screens/cart/widgets/checkout_button.dart';
import 'package:s_store/featues/shop/screens/checkout/widgets/checkout.dart';
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
      body: const Padding(
          padding: EdgeInsets.all(Sizes.defaultSpace),
          child: CartItemsListView()),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: CheckoutButton(onPressed: () {
            Get.to(() => const Checkout());
          })),
    );
  }
}
