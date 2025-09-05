import 'package:flutter/material.dart';
import 'package:widgets/constants.dart';
import 'package:widgets/theme/Common_themes/text_theme.dart';

ThemeData createTheme(
    {bool useMaterial3 = true, required ColorScheme colorScheme}) {
  final ThemeData theme =
      ThemeData.from(useMaterial3: useMaterial3, colorScheme: colorScheme);

  return theme.copyWith(
    textTheme: createTextTheme(
        onSurface: colorScheme.onSurface, surfaceDim: colorScheme.surfaceDim),
  );
}

ThemeData createLightTheme(
    {bool useMaterial3 = true, required Color primaryColor}) {
  final colorScheme = ColorScheme.fromSeed(
    seedColor: primaryColor,
    brightness: Brightness.light,
  );

  return createTheme(colorScheme: colorScheme);
}

ThemeData createDarkTheme(
    {bool useMaterial3 = true, required Color primaryColor}) {
  final colorScheme = ColorScheme.fromSeed(
    seedColor: primaryColor,
    brightness: Brightness.dark,
    primary: Color(0xFF2D8AFF),
    secondary: Color(0xFF2B2B2B),
    onSurface: Color(0xFFF0F0F0),
    surfaceDim: Color(0xFF989898),
  );

  return createTheme(colorScheme: colorScheme);
}

ThemeData getCurrentTheme(Color color, ThemeMode mode) {
  if (ThemeMode.light == mode) {
    return createLightTheme(primaryColor: color);
  }
  return createDarkTheme(primaryColor: color);
}

final mechanixLightTheme = createLightTheme(primaryColor: mechanixPrimaryColor);

final mechanixDarkTheme = createDarkTheme(primaryColor: mechanixPrimaryColor);
