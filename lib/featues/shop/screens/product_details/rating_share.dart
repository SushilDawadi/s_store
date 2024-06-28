import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/sizes.dart';

class RatingAndShare extends StatelessWidget {
  const RatingAndShare({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Iconsax.magic_star5,
              color: Colors.yellow,
              size: 20.0,
            ),
            const SizedBox(width: Sizes.sm),
            Text.rich(
              TextSpan(
                text: '4.5',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(color: Colors.white, fontWeightDelta: 2),
                children: [
                  TextSpan(
                    text: ' (200)',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .apply(color: CColors.white),
                  )
                ],
              ),
            )
          ],
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.share))
      ],
    );
  }
}
