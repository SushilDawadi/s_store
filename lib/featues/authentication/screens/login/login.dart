import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_store/common/divider.dart';
import 'package:s_store/common/social_buttons.dart';
import 'package:s_store/featues/authentication/controllers/login_controller.dart';
import 'package:s_store/featues/authentication/screens/login/widgets/login_form.dart';
import 'package:s_store/featues/authentication/screens/login/widgets/login_header.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/constants/text_Strings.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (controller) {
      print("Building Login widget with controller: ${controller}");
      return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: Sizes.appBarHeight,
              left: Sizes.defaultSpace,
              right: Sizes.defaultSpace,
              bottom: Sizes.defaultSpace,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LoginHeader(),
                //form
                const LoginForm(),
                //Remember me and forget password

                const SizedBox(
                  height: Sizes.spaceBtwSections,
                ),
                //Divider
                const FormDivider(dividerText: TextStrings.orSignInWith),
                const SizedBox(
                  height: Sizes.spaceBtwSections,
                ),

                //footer
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialButtons(
                      logoString: Images.googleLogo,
                      onPressed: () {
                        controller.googleSignIn();
                      },
                    ),
                    const SizedBox(
                      width: Sizes.spaceBtwItems,
                    ),
                    SocialButtons(
                      logoString: Images.facebookLogo,
                      onPressed: () {},
                    ),
                    const SizedBox(
                      width: Sizes.spaceBtwItems,
                    ),
                    SocialButtons(
                      logoString: Images.appleLogo,
                      onPressed: () {},
                    ),
                    const SizedBox(
                      width: Sizes.spaceBtwItems,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
