import 'package:flutter/material.dart';
import 'package:s_store/utils/theme/custom_themes/appbar_theme.dart';
import 'package:s_store/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:s_store/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:s_store/utils/theme/custom_themes/chip_theme.dart';
import 'package:s_store/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:s_store/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:s_store/utils/theme/custom_themes/text_field_theme.dart';
import 'package:s_store/utils/theme/custom_themes/text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.orange,
    scaffoldBackgroundColor: Colors.white,
    textTheme: CustomTextTheme.lightTextTheme,
    chipTheme: CustomChipTheme.lightChipTheme,
    bottomSheetTheme: CustomBottomSheetTheme.lightBottomSheetTheme,
    outlinedButtonTheme: CustomOutlineButtonTheme.lightoutlinedButtonTheme,
    elevatedButtonTheme: CustomElevatedButton.lightElevatedButtonTheme,
    inputDecorationTheme: CustomTextFieldTheme.lightInputDecorationTheme,
    checkboxTheme: CustomCheckboxTheme.lightCheckboxTheme,
    appBarTheme: CustomAppBarTheme.lightAppBarTheme,
  );

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: Colors.orange,
      scaffoldBackgroundColor: Colors.black,
      textTheme: CustomTextTheme.darkTextTheme,
      chipTheme: CustomChipTheme.darkChipTheme,
      bottomSheetTheme: CustomBottomSheetTheme.darkBottomSheetTheme,
      outlinedButtonTheme: CustomOutlineButtonTheme.darkOutlinedButtonTheme,
      elevatedButtonTheme: CustomElevatedButton.darkElevatedButtonTheme,
      inputDecorationTheme: CustomTextFieldTheme.darkInputDecorationTheme,
      checkboxTheme: CustomCheckboxTheme.darkCheckboxTheme,
      appBarTheme: CustomAppBarTheme.darkAppBarTheme);
}
