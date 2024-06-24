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
  });

  final Color color;
  final String? text, buttonTitle;
  final bool showButton;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: Sizes.defaultSpace / 2),
          child: Text(
            text!,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: color, fontSizeFactor: 1.2),
          ),
        ),
        if (showButton)
          TextButton(
              onPressed: onPressed,
              child: Text(
                buttonTitle!,
                style: TextStyle(color: Colors.blue),
              )),
      ],
    );
  }
}
