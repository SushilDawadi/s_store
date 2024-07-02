import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_store/common/common.widgets/appbar/appbar.dart';
import 'package:s_store/common/common.widgets/divider/divider.dart';
import 'package:s_store/common/rounded_container.dart';
import 'package:s_store/featues/shop/screens/cart/widgets/cart_items_list_view.dart';
import 'package:s_store/featues/shop/screens/cart/widgets/checkout_button.dart';
import 'package:s_store/featues/shop/screens/checkout/widgets/billing_payment.dart';
import 'package:s_store/featues/shop/screens/checkout/widgets/billing_section.dart';
import 'package:s_store/featues/shop/screens/checkout/widgets/payment_succesfull.dart';
import 'package:s_store/featues/shop/screens/checkout/widgets/promo_code.dart';
import 'package:s_store/featues/shop/screens/checkout/widgets/shipping_address.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/sizes.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: dark ? CColors.dark : CColors.white,
      appBar: CustomAppBar(
        title: const Text("Order Review"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              const CartItemsListView(
                showButtonAndPrice: false,
              ),
              const SizedBox(
                height: Sizes.defaultSpace,
              ),
              //promo code
              const PromoCode(),
              const SizedBox(
                height: Sizes.defaultSpace,
              ),

              CustomRoundedContainer(
                backgroundColor: dark ? CColors.dark : CColors.white,
                padding: const EdgeInsets.symmetric(
                    vertical: Sizes.sm, horizontal: Sizes.md),
                showborder: true,
                child: const Column(
                  children: [
                    //billingsection
                    BillingSection(),
                    SizedBox(
                      height: Sizes.defaultSpace,
                    ),
                    CustomDivider(
                      indent: 0,
                      endIndent: 0,
                    ),
                    SizedBox(
                      height: Sizes.defaultSpace,
                    ),

                    //billing payment section
                    BillingPayment(),

                    //shipping address
                    ShippingAddress(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(Sizes.defaultSpace),
        child: CheckoutButton(onPressed: () {
          Get.to(() => const PaymentSuccesfull());
        }),
      ),
    );
  }
}
