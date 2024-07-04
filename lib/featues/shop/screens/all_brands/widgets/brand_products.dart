import 'package:flutter/material.dart';
import 'package:s_store/common/common.widgets/appbar/appbar.dart';
import 'package:s_store/common/common.widgets/sortable/sortable_products.dart';
import 'package:s_store/featues/shop/screens/store/widgets/brand_card.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: const Text('Brand'),
        ),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(Sizes.defaultSpace),
            child: Column(
              children: [
                CustomBrandCard(
                  showBorder: true,
                  image: Images.laundry,
                ),
                SizedBox(
                  height: Sizes.spaceBtwSections,
                ),
                SortableProducts()
              ],
            ),
          ),
        ));
  }
}
