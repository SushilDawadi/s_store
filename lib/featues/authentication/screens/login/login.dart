import 'package:flutter/material.dart';
import 'package:s_store/common/divider.dart';
import 'package:s_store/common/social_buttons.dart';
import 'package:s_store/featues/authentication/screens/login/widgets/login_form.dart';
import 'package:s_store/featues/authentication/screens/login/widgets/login_header.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/constants/text_Strings.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: Sizes.appBarHeight,
            left: Sizes.defaultSpace,
            right: Sizes.defaultSpace,
            bottom: Sizes.defaultSpace,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoginHeader(),
              //form
              LoginForm(),
              //Remember me and forget password

              SizedBox(
                height: Sizes.spaceBtwSections,
              ),
              //Divider
              FormDivider(dividerText: TextStrings.orSignInWith),
              SizedBox(
                height: Sizes.spaceBtwSections,
              ),

              //footer
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButtons(logoString: Images.googleLogo),
                  SizedBox(
                    width: Sizes.spaceBtwItems,
                  ),
                  SocialButtons(logoString: Images.facebookLogo),
                  SizedBox(
                    width: Sizes.spaceBtwItems,
                  ),
                  SocialButtons(logoString: Images.appleLogo),
                  SizedBox(
                    width: Sizes.spaceBtwItems,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
