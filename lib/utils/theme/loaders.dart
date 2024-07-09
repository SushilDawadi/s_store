import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/utils/constants/colors.dart';

class Loaders {
  static successSnackBar({required title, message = '', duration = 3}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: Colors.white,
        backgroundColor: CColors.success,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(
          seconds: duration,
        ),
        margin: const EdgeInsets.all(10),
        icon: const Icon(
          Iconsax.check,
          color: CColors.white,
        ));
  }

  static errorSnackBar({required title, message = '', duration = 3}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: Colors.white,
        backgroundColor: CColors.error,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(
          seconds: duration,
        ),
        margin: const EdgeInsets.all(10),
        icon: const Icon(
          Iconsax.close_square,
          color: CColors.white,
        ));
  }

  //warning snackbar
  static warningSnackBar({required title, message = '', duration = 3}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: Colors.white,
        backgroundColor: CColors.warning,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(
          seconds: duration,
        ),
        margin: const EdgeInsets.all(10),
        icon: const Icon(
          Icons.warning_rounded,
          color: CColors.white,
        ));
  }
}
