import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppColors {
  static const primary = Color(0xffc00021);
  static const secondary = Color(0xff002962);
  static const black = Color(0xFF121212);
  static const greyDark = Color(0xFF626262);
  static const grey = Color(0xFF8f8f8f);
  static const greyLight = Color(0xFFd2d2d2);
  static const white = Color(0xFFf4f4f4);
}

abstract class Typography {
  static const TextTheme textTheme = TextTheme(
    headlineLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
    headlineMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
    headlineSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
    titleSmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
    bodyLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    bodyMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
    bodySmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
  );
}

/// Reference to the application theme.
abstract class AppTheme {
  static final visualDensity = VisualDensity.adaptivePlatformDensity;

  /// Light theme and its settings.
  static ThemeData light() => ThemeData(
        brightness: Brightness.light,
        visualDensity: visualDensity,
        textTheme: GoogleFonts.openSansTextTheme(Typography.textTheme)
            .apply(bodyColor: AppColors.greyDark),
        primaryTextTheme: Typography.textTheme,
        backgroundColor: AppColors.white,
        scaffoldBackgroundColor: AppColors.white,
        iconTheme: const IconThemeData(color: AppColors.greyDark),
      );

  /// Dark theme and its settings.
  static ThemeData dark() => ThemeData(
        brightness: Brightness.dark,
        visualDensity: visualDensity,
        textTheme: GoogleFonts.openSansTextTheme(Typography.textTheme).apply(
          bodyColor: AppColors.white,
          displayColor: Colors.white,
        ),
        backgroundColor: AppColors.black,
        scaffoldBackgroundColor: AppColors.black,
        primaryTextTheme: Typography.textTheme,
        iconTheme: const IconThemeData(color: AppColors.greyLight),
      );
}
