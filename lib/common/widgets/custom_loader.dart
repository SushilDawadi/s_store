import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:s_store/utils/constants/image_strings.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(Images.loading, width: 300, height: 300),
      ],
    );
  }

  static stoploading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
