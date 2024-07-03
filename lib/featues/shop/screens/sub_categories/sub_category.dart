import 'package:flutter/material.dart';
import 'package:s_store/common/common.widgets/appbar/appbar.dart';
import 'package:s_store/common/heading.dart';
import 'package:s_store/common/rounded_image.dart';
import 'package:s_store/featues/shop/screens/sub_categories/widgets/product_horizontal_card.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/constants/sizes.dart';

class SubCategory extends StatelessWidget {
  const SubCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text('SubCategory'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              const RoundedCustomImage(
                height: 200,
                width: double.infinity,
                imageUrl: Images.banner1,
              ),
              const SizedBox(
                height: Sizes.spaceBtwSections,
              ),
              Column(
                children: [
                  CustomHeading(
                    color: dark ? CColors.white : CColors.black,
                    text: "Sports ",
                    showButton: true,
                    buttonTitle: "View all",
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (_, __) => const SizedBox(
                        width: Sizes.md,
                      ),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return const ProductHorizontalCard();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
