import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class ThemeApp {
  static ThemeData lightTheme() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        toolbarHeight: 1,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      fontFamily: 'Poppins',
      useMaterial3: true,
      brightness: Brightness.light,
      hintColor: Colors.grey,
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        toolbarHeight: 1,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      fontFamily: 'Poppins',
      useMaterial3: true,
      brightness: Brightness.dark,
      hintColor: Colors.grey,
    );
  }
}
