import 'package:flutter/material.dart';

class AppTheme {
  static const orange = Color(0xFFFF822E);
  static const background = Color(0xFF0B1220);
  static const surface = Color(0xFF182234);

  static final dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: background,
    colorScheme: ColorScheme.fromSeed(
      seedColor: orange,
      brightness: Brightness.dark,
      primary: orange,
      surface: surface,
    ),
    appBarTheme: const AppBarTheme(backgroundColor: background),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surface,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: orange,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),
  );
}
