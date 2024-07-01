import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_store/common/common.widgets/appbar/appbar.dart';
import 'package:s_store/featues/personalization/screens/addresses/widgets/add_address.dart';
import 'package:s_store/featues/personalization/screens/addresses/widgets/single_address.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/helpers/helper_functions.dart';

class UserAddress extends StatelessWidget {
  const UserAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const AddAddress());
        },
        backgroundColor: CColors.secondary,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      backgroundColor:
          HelperFunctions.isDarkMode(context) ? CColors.dark : CColors.white,
      appBar: CustomAppBar(
        title: const Text("Addresses"),
      ),
      body: const SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(Sizes.defaultSpace),
        child: Column(
          children: [
            SingleAddress(
              selectedAddress: true,
            ),
            SingleAddress(
              selectedAddress: false,
            )
          ],
        ),
      )),
    );
  }
}
