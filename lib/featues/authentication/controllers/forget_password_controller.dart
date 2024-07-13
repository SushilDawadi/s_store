import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:s_store/common/widgets/custom_loader.dart';
import 'package:s_store/data/repositories/authentication/authentication_repositories.dart';
import 'package:s_store/utils/device/network_manager.dart';
import 'package:s_store/utils/routes.dart';
import 'package:s_store/utils/theme/loaders.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance =>
      Get.find<ForgetPasswordController>();
  final email = TextEditingController();
  final GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  //send forget password email
  sentForgetPasswordEmail() async {
    try {
      Get.dialog(
        const CustomLoader(),
        barrierDismissible: false,
      );
      //check connectivity
      if (!await CNetworkManager.instance.isInternetConnected()) {
        CustomLoader.stoploading();
        return;
      }

      //form validate
      if (!forgetPasswordFormKey.currentState!.validate()) {
        CustomLoader.stoploading();
        return;
      }
      //send email
      await AuthenticationRepository.instance.forgetPassword(email.text.trim());
      CustomLoader.stoploading();
      Get.offAllNamed(GetRoutes.passwordReset, arguments: email.text.trim());
      Loaders.successSnackBar(
          title: 'Reset email sent', message: 'Please check your email');
    } catch (e) {
      throw 'An error occurred while processing the request.';
    }
  }

  //resend email
  resendEmail() async {
    try {
      Get.dialog(
        const CustomLoader(),
        barrierDismissible: false,
      );
      //check connectivity
      if (!await CNetworkManager.instance.isInternetConnected()) {
        CustomLoader.stoploading();
        return;
      }
      //send email
      await AuthenticationRepository.instance.forgetPassword(email.text.trim());
      CustomLoader.stoploading();
      Loaders.successSnackBar(
          title: 'Reset email sent', message: 'Please check your email');
    } catch (e) {
      throw 'An error occurred while processing the request.';
    }
  }
}
