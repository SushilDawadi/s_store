import 'package:flutter/material.dart';
import 'package:s_store/featues/shop/screens/product_reviews/widgets/rating_star_text.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/constants/sizes.dart';

class UserReviews extends StatelessWidget {
  const UserReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(Images.profileImage),
                ),
                const SizedBox(width: Sizes.md),
                Text(
                  'Sushil Dawadi',
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
            const Icon(Icons.more_vert)
          ],
        ),
        const SizedBox(height: Sizes.md),
        const Row(
          children: [
            RatingStarText(rating: 4),
            SizedBox(
              width: Sizes.md,
            ),
            Text("01,Nov,2024")
          ],
        )
      ],
    );
  }
}
