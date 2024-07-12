import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:s_store/common/widgets/custom_loader.dart';
import 'package:s_store/data/repositories/authentication/authentication_repositories.dart';
import 'package:s_store/featues/authentication/controllers/user_controller.dart';
import 'package:s_store/utils/device/network_manager.dart';
import 'package:s_store/utils/theme/loaders.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final hidePassword = false.obs;
  final rememberMe = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    //check if remember me is checked
    if (localStorage.read('REMEMBER_ME_EMAIL') != null) {
      email.text = localStorage.read('REMEMBER_ME_EMAIL');
      password.text = localStorage.read('REMEMBER_ME_PASSWORD');
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
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      } else {
        localStorage.remove('REMEMBER_ME_EMAIL');
        localStorage.remove('REMEMBER_ME_PASSWORD');
      }
      //sign in
      final userCredentials = await AuthenticationRepository.instance
          .signInWithEmailAndPassword(email.text.trim(), password.text.trim());

      CustomLoader.stoploading();

      AuthenticationRepository.instance.screenRedirect();

      final username = email.text.trim().split('@').first;
      Loaders.successSnackBar(
          title: 'Welcome ${username}',
          message: 'You are logged in successfully');
    } catch (e) {
      CustomLoader.stoploading();
      Loaders.errorSnackBar(title: 'oh snap!', message: e.toString());
    }
  }

  //google sign in
  Future<void> googleSignIn() async {
    try {
      //loading
      Get.dialog(
        const CustomLoader(),
        barrierDismissible: false,
      );
      print("1");
      //check connectivity
      if (!await CNetworkManager.instance.isInternetConnected()) {
        CustomLoader.stoploading();
        return;
      }
      print("2");
      final userCredential =
          await AuthenticationRepository.instance.signInWithGoogle();
      print("3");
      //save user record
      await UserController.instance.saveUserRecord(userCredential!);
      print("4");
      CustomLoader.stoploading();
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      Loaders.errorSnackBar(title: 'oh snap!', message: e.toString());
    }
  }
}
