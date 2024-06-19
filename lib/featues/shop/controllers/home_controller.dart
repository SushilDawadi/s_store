import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  var currentIndex = 0.obs;

  void updateIndicator(int index) {
    currentIndex.value = index;
  }
}
