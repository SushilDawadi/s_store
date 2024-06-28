import 'package:flutter/material.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/sizes.dart';

class CustomHeading extends StatelessWidget {
  const CustomHeading({
    super.key,
    this.color = CColors.white,
    required this.text,
    required this.showButton,
    this.onPressed,
    this.buttonTitle,
    this.padding = const EdgeInsets.symmetric(
      vertical: Sizes.defaultSpace / 2,
    ),
    this.fontSizeFactor = 1.2,
  });
  final EdgeInsetsGeometry padding;
  final Color color;
  final String? text, buttonTitle;
  final bool showButton;
  final void Function()? onPressed;
  final double fontSizeFactor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: padding,
          child: Text(
            text!,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: color, fontSizeFactor: fontSizeFactor),
          ),
        ),
        if (showButton)
          TextButton(
              onPressed: onPressed,
              child: Text(
                buttonTitle!,
                style: const TextStyle(color: CColors.minimalText),
              )),
      ],
    );
  }
}
