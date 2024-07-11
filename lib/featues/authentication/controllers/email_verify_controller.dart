import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:s_store/data/repositories/authentication/authentication_repositories.dart';
import 'package:s_store/featues/authentication/screens/create_successfully/sucess_screen.dart';
import 'package:s_store/utils/theme/loaders.dart';

class EmailVerifyController extends GetxController {
  static EmailVerifyController get instance => Get.find();
  @override
  void onInit() {
    super.onInit();
    setTimerForAutoRedirect();
    sendEmailVerification();
  }

  /// Send Email Verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      Loaders.successSnackBar(
          title: 'Email Sent', message: 'Email sent successfully');
    } catch (e) {
      Loaders.errorSnackBar(title: 'oh snap!', message: e.toString());
    }
  }

  //set timer for auto redirect
  setTimerForAutoRedirect() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        await FirebaseAuth.instance.currentUser?.reload();
        //every one seconds its reload the current user

        final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false) {
          timer.cancel();
          Get.off(() => SuccessScreen(
                onPressed: () async {
                  await AuthenticationRepository.instance.screenRedirect();
                },
              ));
        }
      },
    );
  }

  //Manually check if email verifeid
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
            onPressed: () async {
              await AuthenticationRepository.instance.screenRedirect();
            },
          ));
    }
  }
}
