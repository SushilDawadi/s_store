import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/helpers/helper_functions.dart';

class CustomCartCounter extends StatelessWidget {
  const CustomCartCounter({super.key, this.iconColor = CColors.white});

  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Iconsax.shopping_bag,
            color: HelperFunctions.isDarkMode(context)
                ? CColors.white
                : CColors.dark,
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: CColors.dark,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                "5",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: CColors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
