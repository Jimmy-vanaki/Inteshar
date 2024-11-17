import 'package:flutter/material.dart';
import 'package:Inteshar/app/core/extensions/success_color_theme.dart';

class MyThemes {
  static final ThemeData darkTheme = ThemeData(
    fontFamily: 'dijlah',
    useMaterial3: true,
    dividerTheme:
        const DividerThemeData(color: Color.fromARGB(50, 210, 210, 210)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: const Color.fromARGB(255, 55, 55, 55),
        backgroundColor: const Color.fromARGB(255, 194, 194, 194),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color.fromARGB(255, 194, 194, 194),
      onPrimary: Color.fromARGB(255, 55, 55, 55),
      surface: Color.fromARGB(255, 55, 55, 55),
      onSurface: Color.fromARGB(255, 194, 194, 194),
      secondary: Color.fromARGB(255, 81, 0, 244),
      onSecondary: Color.fromARGB(255, 63, 34, 34),
      error: Color.fromARGB(255, 249, 52, 62),
      onError: Color(0xffffb4ab),
    ),
    extensions: const <ThemeExtension<dynamic>>[
      SuccessColorTheme(
        successColor: Colors.lightGreen,
        onSuccessColor: Colors.white,
      ),
    ],
  );

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'dijlah',
    useMaterial3: true,
    dividerTheme:
        const DividerThemeData(color: Color.fromARGB(20, 221, 221, 221)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: const Color.fromARGB(255, 254, 194, 0),
        backgroundColor: const Color.fromARGB(255, 208, 208, 208),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color.fromARGB(255, 208, 208, 208),
      onPrimary: Color.fromARGB(255, 254, 194, 0),
      surface: Colors.white,
      onSurface: Color.fromARGB(255, 208, 208, 208),
      secondary: Color.fromARGB(255, 240, 205, 140),
      onSecondary: Color(0xff22323f),
      error: Color.fromARGB(255, 249, 52, 62),
      onError: Color(0xffffb4ab),
    ),
    extensions: const <ThemeExtension<dynamic>>[
      SuccessColorTheme(
        successColor: Colors.lightGreen,
        onSuccessColor: Colors.white,
      ),
    ],
  );
}
