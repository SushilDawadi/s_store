import 'package:flutter/material.dart';

class CColors {
  CColors._();

  //app basic color
  static const Color primary = Color(0XFF222831);

  static const Color secondary = Color(0XFFC85250);
  static const Color assent = Color(0XFFf2e9e4);

  //gradient color
  static const Gradient linearGradient = LinearGradient(
    colors: [
      Color(0XFFC85250),
      Color(0XFFf2e9e4),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  //text color
  static const Color textWhite = Colors.white;
  static const Color textPrimary = Color(0XFF212529);
  static const Color textSecondary = Color(0XFF6c757d);
  static const Color minimalText = Color(0XFF3d85c6);

  //background color
  static const Color light = Color(0XFFdee2e6);
  static const Color dark = Color(0XFF222831);
  static const Color backgroundPrimary = Color(0XFFf8f9fa);

  //background container color
  static const Color containerLight = Color(0XFFf8f9fa);
  static const Color containerDark = Color(0XFF222831);

  //button Colors
  static const Color buttonPrimary = Color(0XFFC85250);
  static const Color buttonSecondary = Color(0XFFbfc0c0);
  static const Color buttonDisabled = Color(0XFFdee2e6);

  //border colors
  static const Color borderPrimary = Color(0XFFced4da);
  static const Color borderSecondary = Color(0XFFced4da);

  //Error and Validation Colors
  static const Color error = Color(0XFFC85250);
  static const Color success = Color(0XFF28a745);
  static const Color warning = Color(0XFFffc107);
  static const Color info = Color(0XFF17a2b8);

  //neutral Shades
  static const Color black = Color(0XFF343a40);
  static const Color darkerGrey = Color(0XFF495057);
  static const Color darkGrey = Color(0XFF6c757d);
  static const Color grey = Color(0XFFadb5bd);
  static const Color lightGrey = Color(0XFFced4da);
  static const Color lighterGrey = Color(0XFFd3d3d3);
  static const Color white = Color(0XFFffffff);
}
