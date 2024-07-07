import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:s_store/featues/authentication/screens/login/login.dart';
import 'package:s_store/featues/authentication/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance =>
      Get.find<AuthenticationRepository>();

  //variables
  final deviceStorage = GetStorage();

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  //function to show relevant screen
  screenRedirect() async {
    //local storage
    deviceStorage.writeIfNull('isFirstTime', true);
    deviceStorage.read('isFirstTime') != true
        ? Get.offAll(() => const Login())
        : Get.offAll(() => const onBoardingScreen());
  }
}
