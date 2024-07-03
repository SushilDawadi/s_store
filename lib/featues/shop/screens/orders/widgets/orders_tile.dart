import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/common/rounded_container.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/sizes.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return CustomRoundedContainer(
      backgroundColor: dark ? CColors.dark : CColors.white,
      padding: const EdgeInsets.all(Sizes.md),
      showborder: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Row(
                  children: [
                    const Icon(Iconsax.ship),
                    const SizedBox(width: Sizes.sm),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Processing",
                            style:
                                Theme.of(context).textTheme.titleMedium!.apply(
                                      color: CColors.secondary,
                                    )),
                        Text(
                          "07 Nov 2024",
                          style: Theme.of(context).textTheme.headlineSmall,
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Expanded(
                flex: 1,
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18.0,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    const Icon(Iconsax.tag),
                    const SizedBox(width: Sizes.sm),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Order",
                            style:
                                Theme.of(context).textTheme.labelLarge!.apply(
                                      color: CColors.grey,
                                    )),
                        Text(
                          "[#256f2]",
                          style: Theme.of(context).textTheme.headlineSmall,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    const Icon(Icons.date_range_outlined),
                    const SizedBox(width: Sizes.sm),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Shipping Date",
                            style:
                                Theme.of(context).textTheme.labelLarge!.apply(
                                      color: CColors.grey,
                                    )),
                        Text(
                          "03 Feb 2024",
                          style: Theme.of(context).textTheme.headlineSmall,
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
