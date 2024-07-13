import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:s_store/featues/authentication/screens/login/login.dart';
import 'package:s_store/featues/authentication/screens/onboarding/onboarding.dart';
import 'package:s_store/featues/authentication/screens/verify_email/verify.dart';
import 'package:s_store/navigation_menu.dart';
import 'package:s_store/utils/exception/firebase_exception.dart';
import 'package:s_store/utils/routes.dart';

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
          ? Get.offAllNamed(GetRoutes.login)
          : Get.offAllNamed(GetRoutes.onBoarding);
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
      await GoogleSignIn().signOut();
      await _auth.signOut();
      Get.offAllNamed(GetRoutes.login);
    } on FirebaseAuthException catch (e) {
      throw FirebaseExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw FirebaseExceptions(e.code).message;
    } catch (e) {
      throw 'An error occurred while processing the request.';
    }
  }

  ///-------------------------[Google Authentication -Sign in with Google]
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the Google Sign In process
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        throw 'Google Sign-In aborted.';
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw FirebaseExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw FirebaseExceptions(e.code).message;
    } catch (e) {
      throw 'An error occurred while processing the request.';
    }
  }

  //Forget Password
  Future<void> forgetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw FirebaseExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw FirebaseExceptions(e.code).message;
    } catch (e) {
      throw 'An error occurred while processing the request.';
    }
  }
}
