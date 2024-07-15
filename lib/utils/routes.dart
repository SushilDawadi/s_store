import 'package:get/get.dart';
import 'package:s_store/bindings/general_bindings.dart';
import 'package:s_store/featues/authentication/screens/forget_password/forget_password.dart';
import 'package:s_store/featues/authentication/screens/login/login.dart';
import 'package:s_store/featues/authentication/screens/onboarding/onboarding.dart';
import 'package:s_store/featues/authentication/screens/password_reset_sent/password_reset_sent.dart';
import 'package:s_store/featues/authentication/screens/sign_up/sign_up.dart';
import 'package:s_store/featues/personalization/screens/settings/user_profile.dart';
import 'package:s_store/featues/personalization/screens/settings/widgets/change_name.dart';
import 'package:s_store/featues/personalization/screens/settings/widgets/re_authenticate_user.dart';
import 'package:s_store/navigation_menu.dart';

class GetRoutes {
  static const String login = '/login';
  static const String signUp = '/signUp';
  static const String onBoarding = '/onBoarding';
  static const String forgetPassword = '/forgetPassword';
  static const String passwordReset = '/passwordReset';
  static const String navigationMenu = '/navigationMenu';
  static const String changeName = '/changeName';
  static const String userProfile = '/userProfile';
  static const String reauthenticate = '/reauthenticateForm';

  static final pages = [
    GetPage(
      name: login,
      page: () => const Login(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: signUp,
      page: () => const SignUp(),
      binding: SignUpBindings(),
    ),
    GetPage(
      name: onBoarding,
      page: () => const onBoardingScreen(),
    ),
    GetPage(
      name: forgetPassword,
      page: () => const ForgetPassword(),
      binding: ForgetPasswordBindings(),
    ),
    GetPage(
      name: passwordReset,
      page: () => const PasswordResetSent(),
    ),
    GetPage(
      name: navigationMenu,
      page: () => const CNavigationMenu(),
      binding: NavigationMenu(),
    ),
    GetPage(
      name: changeName,
      page: () => const ChangeName(),
      binding: UpdateUserNameControllerBindings(),
    ),
    GetPage(
      name: userProfile,
      page: () => const UserProfile(),
    ),
    GetPage(
      name: reauthenticate,
      page: () => const ReAuthenticateUser(),
    )
  ];
}
