import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:s_store/utils/constants/colors.dart';

class RatingStarText extends StatelessWidget {
  const RatingStarText({super.key, required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RatingBarIndicator(
            unratedColor: CColors.grey,
            itemSize: 20,
            itemBuilder: (_, __) => const Icon(
                  Icons.star,
                  color: CColors.secondary,
                ),
            rating: rating),
      ],
    );
  }
}
