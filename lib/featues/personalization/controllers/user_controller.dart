import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:s_store/common/widgets/custom_loader.dart';
import 'package:s_store/data/repositories/authentication/authentication_repositories.dart';
import 'package:s_store/data/repositories/user/user_repository.dart';
import 'package:s_store/featues/personalization/models/user_model.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/device/network_manager.dart';
import 'package:s_store/utils/routes.dart';
import 'package:s_store/utils/theme/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find<UserController>();

  final _userRepository = Get.put(UserRepository());
  Rx<UserModel> user = UserModel.empty().obs;
  RxBool profileLoading = false.obs;
  RxBool imageLoading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final reAuthKey = GlobalKey<FormState>();

  @override
  void onInit() {
    fetchUserRecord();
    super.onInit();
  }

  //fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final currentUser = AuthenticationRepository.instance.user;

      if (currentUser != null) {
        final fetchUser = await _userRepository.fetchUserRecord();
        user(fetchUser);
      } else {
        print("User is not authenticated.Skipping fetch.");
      }
    } catch (e) {
      user(UserModel.empty());
      Loaders.errorSnackBar(
          title: "Data not fetched",
          message: "Something went wrong.please try again letter");
    } finally {
      profileLoading.value = false;
    }
  }

  //save user record
  Future<void> saveUserRecord(UserCredential userCredential) async {
    try {
      if (userCredential != null) {
        final nameParts =
            UserModel.nameParts(userCredential.user!.displayName ?? "");
        final username =
            UserModel.generateUsername(userCredential.user!.displayName ?? "");
        //Map Data
        final user = UserModel(
            id: userCredential.user!.uid,
            firstname: nameParts[0],
            lastname:
                nameParts.length > 1 ? nameParts.sublist(1).join(" ") : "",
            username: username,
            email: userCredential.user!.email ?? "",
            phoneNumber: userCredential.user!.phoneNumber ?? "",
            profilePicture: userCredential.user!.photoURL ?? "");

        //save data
        await _userRepository.saveUserRecord(user);
      }
    } catch (e) {
      Loaders.errorSnackBar(
          title: "Data not saved",
          message: "Something went wrong.please try again letter");
    }
  }

  void deleteWarningPopUp() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(Sizes.md),
      title: "Warning",
      middleText: "Are you sure you want to delete your account?",
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            deleteUserAccount();
          },
          child: const Text("Delete"),
        ),
      ],
    );
  }

  void deleteUserAccount() async {
    try {
      Get.dialog(const CustomLoader());
      //first reauthenticate user

      final auth = AuthenticationRepository.instance;
      final provider = auth.user!.providerData.map((e) => e.providerId).first;

      if (provider.isNotEmpty) {
        if (provider == "google.com") {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          CustomLoader.stoploading();
          Get.offAllNamed(GetRoutes.login);
          Loaders.successSnackBar(
              title: "Account Deleted",
              message: "Account deleted successfully");
        } else if (provider == "password") {
          CustomLoader.stoploading();
          Get.toNamed(GetRoutes.reauthenticate);
        }
      }
    } catch (e) {
      Loaders.errorSnackBar(title: "Data not deleted", message: e.toString());
    }
  }

  ///REAUTHENTICATE USER BEFORE DELETING ACCOUNT
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      //loader
      Get.dialog(const CustomLoader());

      //connectivity
      final isConnected = await CNetworkManager.instance.isInternetConnected();
      if (!isConnected) {
        CustomLoader.stoploading();
        return;
      }

      //validate
      if (!reAuthKey.currentState!.validate()) {
        CustomLoader.stoploading();
        return;
      }

      await AuthenticationRepository.instance.reauthenticateUser(
          verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      CustomLoader.stoploading();
      Get.offAllNamed(GetRoutes.login);
      Loaders.successSnackBar(
          title: "Account Deleted", message: "Account deleted successfully");
    } catch (e) {
      CustomLoader.stoploading();
      Loaders.errorSnackBar(
          title: "Error",
          message: "An error occurred while processing the request.");
    }
  }

  //upload user profile picture
  uploadProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxHeight: 512,
        maxWidth: 512,
      );
      if (image != null) {
        imageLoading.value = true;
        final imageUrl =
            await _userRepository.uploadImage('Users/Images/Profile', image);

        //update user profile picture
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};

        await _userRepository.updateSingleField(json);
        user.value.profilePicture = imageUrl;
        imageLoading.value = false;
        Loaders.successSnackBar(
            title: "Success", message: "You Profile Image has been updated!");
      }
    } catch (e) {
      Loaders.errorSnackBar(
          title: "Error",
          message: "An error occurred while processing the request.");
    }
  }
}
