import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // Colors
  

  static const Color primaryColor = Color(0xFF1769E0);
  static const Color primaryDarkColor = Color(0xFF0D47A1);

  static const Color backgroundColor = Color(0xFFF7F9FC);
  static const Color surfaceColor = Colors.white;

  static const Color textColor = Color(0xFF172033);
  static const Color secondaryTextColor = Color(0xFF687386);
  static const Color mutedTextColor = Color(0xFF98A2B3);

  static const Color borderColor = Color(0xFFE7EBF0);

  static const Color successColor = Color(0xFF16803C);
  static const Color successBackgroundColor = Color(0xFFEAF8EF);

  static const Color primaryLightColor = Color(0xFFEAF2FF);

  
  // Theme
 
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    scaffoldBackgroundColor: backgroundColor,

    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: Brightness.light,
    ).copyWith(
      primary: primaryColor,
      surface: surfaceColor,
    ),

    
    // App Bar
    

    appBarTheme: const AppBarTheme(
      backgroundColor: backgroundColor,
      foregroundColor: textColor,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: textColor,
      ),
    ),

    
    // Input Fields
    

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surfaceColor,

      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 15,
      ),

      hintStyle: const TextStyle(
        color: mutedTextColor,
        fontSize: 14,
      ),

      prefixIconColor: secondaryTextColor,

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: borderColor,
        ),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: borderColor,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: primaryColor,
          width: 1.5,
        ),
      ),
    ),

    // Cards

    cardTheme: CardThemeData(
      color: surfaceColor,
      elevation: 0,
      margin: EdgeInsets.zero,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: const BorderSide(
          color: borderColor,
        ),
      ),
    ),

    // Buttons
    

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,

        minimumSize: const Size(
          double.infinity,
          52,
        ),

        elevation: 0,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),

        textStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),

    
    // Typography
    

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 30,
        height: 1.15,
        fontWeight: FontWeight.w800,
        color: textColor,
      ),

      headlineMedium: TextStyle(
        fontSize: 25,
        height: 1.2,
        fontWeight: FontWeight.w800,
        color: textColor,
      ),

      headlineSmall: TextStyle(
        fontSize: 22,
        height: 1.25,
        fontWeight: FontWeight.w700,
        color: textColor,
      ),

      titleLarge: TextStyle(
        fontSize: 19,
        height: 1.3,
        fontWeight: FontWeight.w700,
        color: textColor,
      ),

      titleMedium: TextStyle(
        fontSize: 15,
        height: 1.3,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),

      bodyLarge: TextStyle(
        fontSize: 15,
        height: 1.5,
        color: textColor,
      ),

      bodyMedium: TextStyle(
        fontSize: 14,
        height: 1.45,
        color: secondaryTextColor,
      ),

      bodySmall: TextStyle(
        fontSize: 12,
        height: 1.4,
        color: secondaryTextColor,
      ),
    ),
  );
}