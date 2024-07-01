import 'package:flutter/material.dart';
import 'package:s_store/featues/shop/screens/product_reviews/widgets/rating_bar_indicator.dart';
import 'package:s_store/featues/shop/screens/product_reviews/widgets/rating_star_text.dart';
import 'package:s_store/featues/shop/screens/product_reviews/widgets/user_reviews.dart';
import 'package:s_store/utils/constants/sizes.dart';

class ProductReviews extends StatelessWidget {
  const ProductReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Reviews"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Rating and Reviews are verified and are from people who use the same type of device that you use.",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: Sizes.defaultSpace),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      "4.8",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                  const Expanded(
                    flex: 7,
                    child: Column(
                      children: [
                        CustomRatingBarIndicator(text: "5", value: 1),
                        CustomRatingBarIndicator(text: "4", value: 0.8),
                        CustomRatingBarIndicator(text: "3", value: 0.6),
                        CustomRatingBarIndicator(text: "2", value: 0.4),
                        CustomRatingBarIndicator(text: "1", value: 0.2)
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const RatingStarText(
                    rating: 4.2,
                  ),
                  Text(
                    "12,611",
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
              const SizedBox(height: Sizes.defaultSpace),
              //user reviews
              const UserReviews(),
              const SizedBox(height: Sizes.defaultSpace),
              const UserReviews()
            ],
          ),
        ),
      ),
    );
  }
}
