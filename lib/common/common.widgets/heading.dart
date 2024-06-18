import 'package:flutter/material.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/sizes.dart';

class CustomHeading extends StatelessWidget {
  const CustomHeading({
    super.key,
    this.color = CColors.white,
    required this.text,
  });

  final Color color;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: color, fontSizeFactor: 1.2),
          ),
        ),
      ],
    );
  }
}
