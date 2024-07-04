import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/common/common.widgets/product/product_card_vertical.dart';
import 'package:s_store/common/grid_view_layout.dart';
import 'package:s_store/utils/constants/sizes.dart';

class SortableProducts extends StatelessWidget {
  const SortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          decoration: const InputDecoration(
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.only(right: Sizes.md, left: Sizes.sm),
                child: Icon(Iconsax.sort),
              )),
          items: ['Nike', 'Addidas', 'puma', 'Reebook']
              .map(
                (option) => DropdownMenuItem(
                  value: option,
                  child: Text(option),
                ),
              )
              .toList(),
          onChanged: (value) {},
        ),
        const SizedBox(
          height: Sizes.spaceBtwSections,
        ),
        //products list
        GridViewLayout(
            itemCount: 6,
            itemBuilder: (context, index) => const ProductCardVertical())
      ],
    );
  }
}
