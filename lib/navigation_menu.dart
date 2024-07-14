import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/featues/personalization/screens/settings/settings.dart';
import 'package:s_store/featues/shop/screens/home/home.dart';
import 'package:s_store/featues/shop/screens/store/store.dart';
import 'package:s_store/featues/shop/screens/wishlist/wishlist.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/helpers/helper_functions.dart';

class CNavigationMenu extends StatelessWidget {
  const CNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 75,
          elevation: 0,
          onDestinationSelected: (index) =>
              controller.currentIndex.value = index,
          selectedIndex: controller.currentIndex.value,
          indicatorColor: HelperFunctions.isDarkMode(context)
              ? CColors.light.withOpacity(0.1)
              : CColors.dark.withOpacity(0.1),
          backgroundColor: HelperFunctions.isDarkMode(context)
              ? CColors.dark
              : CColors.white,
          destinations: const [
            NavigationDestination(
              icon: Icon(Iconsax.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.shop),
              label: 'Store',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.heart),
              label: 'Wishlist',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.user),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.currentIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> currentIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const Store(),
    const FavouriteScreen(),
    const Settings(),
  ];
}
