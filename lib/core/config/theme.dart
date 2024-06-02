import 'package:flutter/material.dart';

class AppTheme {
  static final baseTheme = ThemeData(
    useMaterial3: true,

    colorSchemeSeed: const Color(0xFFF75F55),

    // scaffold theme
    scaffoldBackgroundColor: const Color(0xFFf8f8f8),

    // Text input theme
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(color: Color(0x1F263238)),
      ),
      fillColor: Colors.white,
      filled: true,
      prefixIconColor: Color(0xff7C8592),
      suffixIconColor: Color(0xff7C8592),
    ),

    // button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(Colors.white),
        shape: WidgetStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
      ),
    ),
  );
}
