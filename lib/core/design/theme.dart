import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: Color(0xFFFFFDD0),
    onPrimary: Color(0xEE000000),
    //surface: Colors.white.withOpacity(0.25),
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: Color(0xFF90CAF9),
    onPrimary: Color(0xFF888888),
    //surface: Colors.black.withOpacity(0.25),

  ),
);

/*
Color primaryColor = Theme.of(context).colorScheme.primary;
Color accentColor = Theme.of(context).colorScheme.tertiary;
 */
