import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:s_store/common/widgets/custom_loader.dart';
import 'package:s_store/data/repositories/user/user_repository.dart';
import 'package:s_store/featues/personalization/controllers/user_controller.dart';
import 'package:s_store/featues/personalization/screens/settings/user_profile.dart';
import 'package:s_store/utils/routes.dart';
import 'package:s_store/utils/theme/loaders.dart';

class UpdateUserNameController extends GetxController {
  static UpdateUserNameController get instance =>
      Get.find<UpdateUserNameController>();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepo = Get.put(UserRepository());
  final changeNameFormKey = GlobalKey<FormState>();
  @override
  void onInit() {
    super.onInit();
    firstName.text = userController.user.firstname;
    lastName.text = userController.user.lastname;
  }

  updateName() async {
    //loader
    Get.dialog(const CustomLoader());

    //validate
    if (!changeNameFormKey.currentState!.validate()) {
      CustomLoader.stoploading();
      return;
    }

    Map<String, dynamic> name = {
      "Firstname": firstName.text.trim(),
      "Lastname": lastName.text.trim(),
    };

    await userRepo.updateSingleField(name);

    userController.user.firstname = firstName.text.trim();
    userController.user.lastname = lastName.text.trim();
    userController.update();

    CustomLoader.stoploading();
    Loaders.successSnackBar(
        title: "Congratulations", message: "Your Name has been updated");

    Get.offNamedUntil(GetRoutes.userProfile, (route) => route.isFirst);
  }
}
