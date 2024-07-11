import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:s_store/featues/authentication/screens/login/login.dart';
import 'package:s_store/featues/authentication/screens/onboarding/onboarding.dart';
import 'package:s_store/featues/authentication/screens/verify_email/verify.dart';
import 'package:s_store/navigation_menu.dart';
import 'package:s_store/utils/exception/firebase_exception.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance =>
      Get.find<AuthenticationRepository>();

  //variables
  final _auth = FirebaseAuth.instance;
  final deviceStorage = GetStorage();

  @override
  void onReady() {
    FlutterNativeSplash.remove();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      screenRedirect();
    });
  }

  //function to show relevant screen
  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Future.delayed(Duration.zero, () {
          Get.offAll(() => const NavigationMenu());
        });
      } else {
        Future.delayed(Duration.zero, () {
          Get.offAll(() => VerifyEmail(
                email: _auth.currentUser?.email,
              ));
        });
      }
    } else {
      //local storage
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => const Login())
          : Get.offAll(() => const onBoardingScreen());
    }
  }

  /*--------------------------Email and password login*/
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw FirebaseExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw FirebaseExceptions(e.code).message;
    } catch (e) {
      throw 'An error occurred while processing the request.';
    }
  }

  /*--------------------------Email and password register*/
  //Register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw FirebaseExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw FirebaseExceptions(e.code).message;
    } catch (e) {
      throw 'An error occurred while processing the request.';
    }
  }

  //Send Email Verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw FirebaseExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw FirebaseExceptions(e.code).message;
    } catch (e) {
      throw 'An error occurred while processing the request.';
    }
  }

  //Logout user
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      Get.offAll(() => const Login());
    } on FirebaseAuthException catch (e) {
      throw FirebaseExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw FirebaseExceptions(e.code).message;
    } catch (e) {
      throw 'An error occurred while processing the request.';
    }
  }
}
