import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_store/featues/authentication/screens/login/login.dart';

class onBoardingController extends GetxController {
  static onBoardingController get instance => Get.find();

  //variables
  final pageController = PageController();
  RxInt currentIndex = 0.obs;

  void updatePageIndicator(int index) => currentIndex.value = index;
  void dotNavigationClick(int index) {
    currentIndex.value = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 600),
        curve: Curves.linearToEaseOut);
  }

  void nextPage() {
    if (currentIndex.value == 2) {
      Get.off(() => const Login());
    } else {
      int page = currentIndex.value + 1;
      pageController.animateToPage(page,
          duration: const Duration(milliseconds: 600),
          curve: Curves.linearToEaseOut);
    }
  }

  void skipPage() {
    currentIndex.value = 2;
    pageController.animateToPage(2,
        duration: const Duration(milliseconds: 600),
        curve: Curves.linearToEaseOut);
  }
}
