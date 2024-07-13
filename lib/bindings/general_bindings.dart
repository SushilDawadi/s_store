import 'package:get/get.dart';
import 'package:s_store/featues/authentication/controllers/forget_password_controller.dart';
import 'package:s_store/featues/authentication/controllers/login_controller.dart';
import 'package:s_store/featues/authentication/controllers/signup_controller.dart';
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
