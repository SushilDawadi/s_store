import 'package:get/get.dart';
import 'package:s_store/featues/authentication/controllers/forget_password_controller.dart';
import 'package:s_store/featues/authentication/controllers/login_controller.dart';
import 'package:s_store/featues/authentication/controllers/signup_controller.dart';
import 'package:s_store/featues/personalization/controllers/update_user_name_controller.dart';
import 'package:s_store/featues/personalization/controllers/user_controller.dart';
import 'package:s_store/featues/shop/controllers/category_controller.dart';
import 'package:s_store/featues/shop/controllers/home_controller.dart';
import 'package:s_store/navigation_menu.dart';
import 'package:s_store/utils/device/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CNetworkManager());
  }
}

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}

class SignUpBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SignupController());
  }
}

class ForgetPasswordBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ForgetPasswordController());
  }
}

class UpdateUserNameControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(UpdateUserNameController());
  }
}

// class CategoryControllerBindings extends Bindings {
//   @override
//   void dependencies() {
//     Get.put(CategoryController());
//   }
// }

class NavigationMenu extends Bindings {
  @override
  void dependencies() {
    Get.put(NavigationController());
    Get.put(HomeController());
    Get.put(UserController());
  }
}
