import 'package:flutter/material.dart';

class CustomOutlineButtonTheme {
  CustomOutlineButtonTheme._();

  static final lightoutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.black,
      side: const BorderSide(
        color: Color(0XFFC85250),
      ),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
    ),
  );

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      side: const BorderSide(
        color: Color(0XFFC85250),
      ),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
    ),
  );
}
