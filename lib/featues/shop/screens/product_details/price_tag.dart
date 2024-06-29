import 'package:flutter/material.dart';

class CustomPriceTag extends StatelessWidget {
  const CustomPriceTag(
      {super.key,
      this.currency = '\$',
      required this.isLarge,
      required this.price,
      this.decoration = TextDecoration.none});

  final String currency;
  final bool isLarge;
  final String price;
  final TextDecoration decoration;
  @override
  Widget build(BuildContext context) {
    return Text(
      "$currency$price",
      style: isLarge
          ? Theme.of(context)
              .textTheme
              .headlineMedium!
              .apply(decoration: decoration)
          : Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(decoration: decoration),
    );
  }
}
