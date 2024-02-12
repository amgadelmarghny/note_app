import 'package:flutter/material.dart';

abstract class ThemeApp {
  static ThemeData lightTheme() {
    return ThemeData(
      fontFamily: 'Poppins',
      useMaterial3: true,
      brightness: Brightness.light,
      hintColor: Colors.grey,
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      fontFamily: 'Poppins',
      useMaterial3: true,
      brightness: Brightness.dark,
      hintColor: Colors.grey,
    );
  }
}
