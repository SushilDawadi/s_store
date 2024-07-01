import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/sizes.dart';

class ReviewsContainer extends StatelessWidget {
  const ReviewsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Sizes.md),
      decoration: BoxDecoration(
        color: CColors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(Sizes.sm),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "S-Store's",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                "02 Nov, 2024",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          const SizedBox(height: Sizes.sm),
          const ReadMoreText(
              trimCollapsedText: "show more ",
              trimLength: 90,
              trimMode: TrimMode.Length,
              moreStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: CColors.secondary),
              "The user interface is very good and the product is also very good. I am very happy with the product. Great job! i was able to navigate and make purchase quicky and easily great app "),
        ],
      ),
    );
  }
}
