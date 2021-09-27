import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


 const  String appName = "Haux.";

abstract class AppColors {
  static const secondary = Color(0xFF363B64);
  static const accent = Color(0xFFC69DFF);
  static const darkText = Color(0xFF363B64);
  static const lightText = Color(0xFFF5F5F5);
  static const textFaded = Color(0xFF9899A5);
  static const iconLight = Color(0xFFC69DFF);
  static const iconDark = Color(0xFFC69DFF);
  static const textHighlight = secondary;
  static const cardLight = Color(0xFFF9FAFE);
  static const cardDark = Color(0xFF303334);
  static const  lightButton = iconLight;
}

abstract class _LightColors {
  static const background = Colors.white;
  static const card = AppColors.cardLight;
}

abstract class _DarkColors {
  static const background = Color(0xFF1B1E1F);
  static const card = AppColors.cardDark;
}

/// Reference to the application theme.
abstract class AppTheme {
  static const accentColor = AppColors.accent;
  static final visualDensity = VisualDensity.adaptivePlatformDensity;

  /// Light theme and its settings.
  static ThemeData light() => ThemeData(
        brightness: Brightness.light,
        visualDensity: visualDensity,
        textTheme:
            GoogleFonts.poppinsTextTheme().apply(bodyColor: AppColors.darkText),
        backgroundColor: _LightColors.background,
        scaffoldBackgroundColor: _LightColors.background,
        cardColor: _LightColors.card,
        primaryTextTheme: const TextTheme(
          headline6: TextStyle(color: AppColors.darkText),
        ),
        iconTheme: const IconThemeData(color: AppColors.iconDark), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor),
      );

  /// Dark theme and its settings.
  static ThemeData dark() => ThemeData(
       // brightness: Brightness.dark,
        visualDensity: visualDensity,
        textTheme:
            GoogleFonts.poppinsTextTheme().apply(bodyColor: AppColors.lightText),
        backgroundColor: _DarkColors.background,
        scaffoldBackgroundColor: _DarkColors.background,
        cardColor: _DarkColors.card,
        primaryTextTheme: const TextTheme(
          headline6: TextStyle(color: AppColors.lightText),
        ), 
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor),
        iconTheme: const IconThemeData(color: AppColors.iconLight),
      );
}