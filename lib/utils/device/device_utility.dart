import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DeviceUtils {
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static void setStatusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: color,
    ));
  }

  static bool isLandScapeOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom == 0;
  }

  static bool isPortraitOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom != 0;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(Get.context!).size.width;
  }

  static double getPixelRatio(BuildContext context) {
    return MediaQuery.of(Get.context!).devicePixelRatio;
  }

  static double getStatusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  static double getBottomNaviagationBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }

  static bool isIOS() {
    return Platform.isIOS;
  }

  static bool isAndroid() {
    return Platform.isAndroid;
  }

  static double getAppBarHeight() {
    return kToolbarHeight;
  }

  static void launchUrl(String url) async {}
}
