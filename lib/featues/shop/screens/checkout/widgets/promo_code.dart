import 'package:flutter/material.dart';
import 'package:s_store/common/rounded_container.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/sizes.dart';

class PromoCode extends StatelessWidget {
  const PromoCode({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return CustomRoundedContainer(
      showborder: true,
      backgroundColor: dark ? CColors.dark : CColors.white,
      padding:
          const EdgeInsets.symmetric(vertical: Sizes.sm, horizontal: Sizes.md),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "Have a promo code? Enter here",
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            width: 80,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: CColors.grey.withOpacity(0.2),
                    side: BorderSide(color: CColors.grey.withOpacity(0.2))),
                child: Text("Apply",
                    style: Theme.of(context).textTheme.bodySmall!.apply(
                          color: CColors.grey,
                        ))),
          )
        ],
      ),
    );
  }
}
