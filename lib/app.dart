import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:s_store/featues/authentication/screens/onboarding/onboarding.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: Scaffold(
          body: Container(
            decoration: const BoxDecoration(color: CColors.secondary),
            child: const Center(
              child: CircularProgressIndicator(
                color: CColors.white,
              ),
            ),
          ),
        ));
  }
}
