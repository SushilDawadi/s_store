import 'package:flutter/material.dart';
import 'package:s_store/common/heading.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/constants/sizes.dart';

class BillingPayment extends StatelessWidget {
  const BillingPayment({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        CustomHeading(
          text: "Payment Method",
          showButton: true,
          buttonTitle: "Change",
          color: dark ? Colors.white : Colors.black,
        ),
        const SizedBox(
          height: Sizes.sm,
        ),
        const Row(
          children: [
            Image(
              image: AssetImage(Images.esewa),
              width: 32,
              height: 32,
            ),
            SizedBox(
              width: Sizes.md,
            ),
            Text("Esewa")
          ],
        )
      ],
    );
  }
}
