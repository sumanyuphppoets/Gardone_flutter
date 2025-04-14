import 'package:flutter/material.dart';

class AppTheme {
  // Dynamic Colors
  static Color primaryColor = Colors.green.shade900;
  static Color secondaryColor = Colors.orange.shade700;
  static Color backgroundColor = Colors.white;
  static Color textColor = Colors.black;

  // Dynamic Text Styles
  static TextStyle headingStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: textColor,
  );

  static TextStyle bodyStyle = TextStyle(
    fontSize: 16,
    color: textColor,
  );

  static TextStyle buttonTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  // Dynamic Padding & Margin
  static EdgeInsets defaultPadding = const EdgeInsets.all(16);
  static EdgeInsets cardPadding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8);
}
