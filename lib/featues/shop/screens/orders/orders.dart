import 'package:flutter/material.dart';
import 'package:s_store/common/common.widgets/appbar/appbar.dart';
import 'package:s_store/featues/shop/screens/orders/widgets/orders_tile.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/sizes.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text('My Orders '),
      ),
      backgroundColor: dark ? CColors.dark : CColors.white,
      body: Padding(
        padding: const EdgeInsets.all(Sizes.defaultSpace),
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (_, __) => const SizedBox(height: Sizes.md),
          itemCount: 7,
          itemBuilder: (context, index) {
            return const OrderTile();
          },
        ),
      ),
    );
  }
}
