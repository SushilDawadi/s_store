import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_store/featues/authentication/screens/onboarding/onboarding.dart';
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
        home: const onBoardingScreen());
  }
}
