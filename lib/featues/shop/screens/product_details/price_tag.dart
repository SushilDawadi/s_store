import 'package:flutter/material.dart';

class CustomPriceTag extends StatelessWidget {
  const CustomPriceTag(
      {super.key,
      this.currency = '\$',
      required this.isLarge,
      required this.price});

  final String currency;
  final bool isLarge;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Text(
      "$currency$price",
      style: isLarge
          ? Theme.of(context)
              .textTheme
              .headlineMedium!
              .apply(color: Colors.white)
          : Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: Colors.white),
    );
  }
}
