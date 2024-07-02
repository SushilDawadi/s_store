import 'package:flutter/material.dart';
import 'package:s_store/common/heading.dart';
import 'package:s_store/utils/constants/sizes.dart';

class ShippingAddress extends StatelessWidget {
  const ShippingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        CustomHeading(
          text: "Shipping Address",
          showButton: true,
          buttonTitle: "Change",
          color: dark ? Colors.white : Colors.black,
        ),
        const SizedBox(
          height: Sizes.sm,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sushil Dawadi",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: Sizes.xs,
            ),
            const Row(
              children: [
                Icon(
                  Icons.phone,
                  size: 15.0,
                ),
                SizedBox(
                  width: Sizes.sm,
                ),
                Text("9825157838")
              ],
            ),
            const SizedBox(
              height: Sizes.xs,
            ),
            Row(
              children: [
                const Icon(
                  Icons.person,
                  size: 15.0,
                ),
                const SizedBox(
                  width: Sizes.sm,
                ),
                Expanded(
                  child: Text(
                    "Nadipur ,Pokhara ,33700 ,Nepal",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
