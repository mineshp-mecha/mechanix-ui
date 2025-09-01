import 'package:flutter/material.dart';

TextTheme createTextTheme(Color textColor) {
  return TextTheme(
    displayLarge: TextStyle(color: textColor, fontSize: 57),
    displayMedium: TextStyle(color: textColor, fontSize: 45),
    displaySmall: TextStyle(color: textColor, fontSize: 36),
    headlineLarge:
        TextStyle(color: textColor, fontSize: 32, fontWeight: FontWeight.bold),
    headlineMedium:
        TextStyle(color: textColor, fontSize: 28, fontWeight: FontWeight.bold),
    headlineSmall:
        TextStyle(color: textColor, fontSize: 24, fontWeight: FontWeight.bold),
    titleLarge:
        TextStyle(color: textColor, fontSize: 22, fontWeight: FontWeight.w500),
    titleMedium:
        TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.w500),
    titleSmall:
        TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.w500),
    bodyLarge: TextStyle(color: textColor, fontSize: 16),
    bodyMedium: TextStyle(color: textColor, fontSize: 14),
    bodySmall: TextStyle(color: textColor, fontSize: 12),
    labelLarge: TextStyle(color: textColor, fontSize: 18),
    labelMedium:
        TextStyle( fontSize: 16, fontWeight: FontWeight.w500), // settings section list menu label
    labelSmall: TextStyle(color: textColor, fontSize: 11),
  );
}
