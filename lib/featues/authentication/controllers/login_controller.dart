import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:s_store/common/widgets/custom_loader.dart';
import 'package:s_store/data/repositories/authentication/authentication_repositories.dart';
import 'package:s_store/utils/device/network_manager.dart';
import 'package:s_store/utils/theme/loaders.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final hidePassword = false.obs;
  final rememberMe = true.obs;
  final localStorate = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    //check if remember me is checked
    if (localStorate.read('REMEMBER_ME_EMAIL') != null) {
      email.text = localStorate.read('REMEMBER_ME_EMAIL');
      password.text = localStorate.read('REMEMBER_ME_PASSWORD');
      rememberMe.value = true;
    }
  }

  Future<void> emailAndPasswordSignIn() async {
    try {
      //loading
      Get.dialog(
        const CustomLoader(),
        barrierDismissible: false,
      );
      //check connectivity
      if (!await CNetworkManager.instance.isInternetConnected()) {
        CustomLoader.stoploading();
        return;
      }
      //form validation
      if (!loginFormKey.currentState!.validate()) {
        CustomLoader.stoploading();
        return;
      }

      //Save Data if Remember me is checked
      if (rememberMe.value) {
        localStorate.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorate.write('REMEMBER_ME_PASSWORD', password.text.trim());
      } else {
        localStorate.remove('REMEMBER_ME_EMAIL');
        localStorate.remove('REMEMBER_ME_PASSWORD');
      }
      //sign in
      final userCredentials = await AuthenticationRepository.instance
          .signInWithEmailAndPassword(email.text.trim(), password.text.trim());

      CustomLoader.stoploading();

      AuthenticationRepository.instance.screenRedirect();
      Loaders.successSnackBar(
          title: 'Welcome', message: 'You are logged in successfully');
    } catch (e) {
      CustomLoader.stoploading();
      Loaders.errorSnackBar(title: 'oh snap!', message: e.toString());
    }
  }
}
