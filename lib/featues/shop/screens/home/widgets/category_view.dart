import 'package:flutter/material.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/constants/sizes.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.spaceBtwItems),
      child: SizedBox(
        height: 80,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 8,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(right: Sizes.spaceBtwItems / 2),
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      padding: const EdgeInsets.all(Sizes.sm),
                      decoration: BoxDecoration(
                        color: CColors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Image.asset(
                          Images.sport,
                          color: CColors.dark.withOpacity(0.8),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: Sizes.spaceBtwItems / 1.5,
                    ),
                    Text(
                      "Shoes",
                      style: Theme.of(context).textTheme.labelMedium!.apply(
                            color: CColors.white,
                            overflow: TextOverflow.ellipsis,
                          ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
