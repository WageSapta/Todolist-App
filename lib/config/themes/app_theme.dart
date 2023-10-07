import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      textTheme: GoogleFonts.poppinsTextTheme(),
      scaffoldBackgroundColor: Colors.grey[200],
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Colors.grey.shade900,
        onPrimary: Colors.white,
        secondary: Colors.blue,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        background: Colors.grey.shade200,
        onBackground: Colors.grey.shade900,
        surface: Colors.white,
        onSurface: Colors.black,
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(iconSize: 30),
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
    );
  }
}
