import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_store/common/common.widgets/sortable/sortable_products.dart';
import 'package:s_store/common/grid_view_layout.dart';
import 'package:s_store/common/heading.dart';
import 'package:s_store/featues/shop/screens/all_brands/widgets/brand_products.dart';
import 'package:s_store/featues/shop/screens/store/widgets/brand_card.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/constants/sizes.dart';

class AllBrands extends StatelessWidget {
  const AllBrands({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Brands'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              CustomHeading(
                text: "Brands",
                showButton: false,
                color: dark ? CColors.white : CColors.black,
              ),
              GridViewLayout(
                  mainAxisExtent: 80,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return CustomBrandCard(
                      showBorder: true,
                      image: Images.sport,
                      onPressed: () {
                        Get.to(() => const BrandProducts());
                      },
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
