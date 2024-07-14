import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:s_store/data/repositories/user/user_repository.dart';
import 'package:s_store/featues/personalization/models/user_model.dart';
import 'package:s_store/utils/theme/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find<UserController>();

  final _userRepository = Get.put(UserRepository());
  UserModel user = UserModel.empty();
  RxBool profileLoading = false.obs;
  @override
  void onInit() {
    fetchUserRecord();
    super.onInit();
  }

  //fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final fetchUser = await _userRepository.fetchUserRecord();
      user = fetchUser;
    } catch (e) {
      Loaders.errorSnackBar(
          title: "Data not found",
          message: "Something went wrong.please try again letter");
    } finally {
      profileLoading.value = false;
      update();
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
}
