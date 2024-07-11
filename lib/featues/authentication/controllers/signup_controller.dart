import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_store/common/widgets/custom_loader.dart';
import 'package:s_store/data/repositories/authentication/authentication_repositories.dart';
import 'package:s_store/data/repositories/user/user_repository.dart';
import 'package:s_store/featues/authentication/models/user_model.dart';
import 'package:s_store/featues/authentication/screens/verify_email/verify.dart';
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
      Get.dialog(
        const CustomLoader(),
        barrierDismissible: false,
      );
      //check connectivity
      final isInternetConnected =
          await CNetworkManager.instance.isInternetConnected();
      if (!isInternetConnected) {
        CustomLoader.stoploading();
        return;
      }

      //Form Validation
      if (!signUpFormKey.currentState!.validate()) {
        CustomLoader.stoploading();
        return;
      }

      //Policy check
      if (!termsAndPolicy.value) {
        CustomLoader.stoploading();
        Loaders.warningSnackBar(
            title: 'Warnning', message: 'Please accept terms and policy');
        return;
      }

      //register user in the firebase authentication & save user data in firestore
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //save user data in the firebase firestore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstname: firstname.text.trim(),
          lastname: lastname.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phone.text.trim(),
          profilePicture: "");

      final userRepository = Get.put(UserRepository());

      await userRepository.saveUserRecord(newUser);
      //remove loader
      CustomLoader.stoploading();

      //show success message
      Loaders.successSnackBar(
          title: 'Account created', message: 'Account created successfully');

      Get.to(() => VerifyEmail(
            email: email.text.trim(),
          ));
    } catch (e) {
      CustomLoader.stoploading();
      Loaders.errorSnackBar(
          title: 'Error', message: 'An error occurred, please try again');
      //print(e.toString());
    }
  }
}
