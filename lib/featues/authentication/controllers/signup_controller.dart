import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_store/utils/device/network_manager.dart';
import 'package:s_store/utils/theme/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final hidePassword = true.obs;
  final termsAndPolicy = true.obs;
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final username = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  Future<void> signUp() async {
    try {
      //loader
      CircularProgressIndicator();

      //check connectivity
      final isInternetConnected =
          await CNetworkManager.instance.isInternetConnected();
      if (!isInternetConnected) {
        return;
      }

      //Form Validation
      if (signUpFormKey.currentState!.validate()) {
        return;
      }

      //Policy check
      if (!termsAndPolicy.value) {
        Loaders.warningSnackBar(
            title: 'Warnning', message: 'Please accept terms and policy');
        return;
      }

      //register user in the firebase authentication & save user data in firestore
    } catch (e) {
      Loaders.errorSnackBar(
          title: 'Error', message: 'An error occurred, please try again');
      print(e.toString());
    }
  }
}
