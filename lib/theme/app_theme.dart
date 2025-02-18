

import 'package:flutter/material.dart';



// Light Theme
final ThemeData lightThemeData = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    color: Colors.blue,
    elevation: 4,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white, backgroundColor: Colors.blue, // Text color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(color: Colors.black87, fontSize: 16),
  ),
);


// Dark Theme
final ThemeData darkThemeData = ThemeData(
  brightness: Brightness.dark,
  primaryColor: darkPrimary,
  scaffoldBackgroundColor: darkBackground,
  cardColor: darkSurface,
  appBarTheme: AppBarTheme(
    color: darkSurface,
    elevation: 0,
    iconTheme: IconThemeData(color: darkOnSurface),
    titleTextStyle: TextStyle(
      color: darkOnSurface,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: darkPrimary,
      foregroundColor: darkOnPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    ),
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(color: darkOnBackground, fontSize: 16),
  ),
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: darkPrimary,
    onPrimary: darkOnPrimary,
    primaryContainer: darkPrimaryContainer,
    onPrimaryContainer: darkOnPrimaryContainer,
    secondary: darkSecondary,
    onSecondary: darkOnSecondary,
    secondaryContainer: darkSecondaryContainer,
    onSecondaryContainer: darkOnSecondaryContainer,
    tertiary: darkTertiary,
    onTertiary: darkOnTertiary,
    tertiaryContainer: darkTertiaryContainer,
    onTertiaryContainer: darkOnTertiaryContainer,
    error: darkError,
    onError: darkOnError,
    errorContainer: darkErrorContainer,
    onErrorContainer: darkOnErrorContainer,
    background: darkBackground,
    onBackground: darkOnBackground,
    surface: darkSurface,
    onSurface: darkOnSurface,
    surfaceVariant: darkSurfaceVariant,
    onSurfaceVariant: darkOnSurfaceVariant,
    outline: darkOutline,
    shadow: darkScrim,
    inverseSurface: darkInverseSurface,
    onInverseSurface: darkOnInverseSurface,
    inversePrimary: darkInversePrimary,
  ).copyWith(surface: darkBackground),
);


// Dark Theme
final Color darkPrimary = Color(0xFF81C784);
final Color darkOnPrimary = Color(0xFF1B5E20);
final Color darkPrimaryContainer = Color(0xFF2E7D32);
final Color darkOnPrimaryContainer = Color(0xFFEADDFF);
final Color darkSecondary = Color(0xFFCCC2DC);
final Color darkOnSecondary = Color(0xFF332D41);
final Color darkSecondaryContainer = Color(0xFF4A4458);
final Color darkOnSecondaryContainer = Color(0xFFE8DEF8);
final Color darkTertiary = Color(0xFFEFB8C8);
final Color darkOnTertiary = Color(0xFF492532);
final Color darkTertiaryContainer = Color(0xFF633B48);
final Color darkOnTertiaryContainer = Color(0xFFFFD8E4);
final Color darkError = Color(0xFFF2B8B5);
final Color darkOnError = Color(0xFF601410);
final Color darkErrorContainer = Color(0xFF8C1D18);
final Color darkOnErrorContainer = Color(0xFFF9DEDC);
final Color darkOutline = Color(0xFF938F99);
final Color darkBackground = Color(0xFF1C1B1F);
final Color darkOnBackground = Color(0xFFE6E1E5);
final Color darkSurface = Color(0xFF1C1B1F);
final Color darkOnSurface = Color(0xFFE6E1E5);
final Color darkSurfaceVariant = Color(0xFF49454F);
final Color darkOnSurfaceVariant = Color(0xFFCAC4D0);
final Color darkInverseSurface = Color(0xFFE6E1E5);
final Color darkOnInverseSurface = Color(0xFF313033);
final Color darkInversePrimary = Color(0xFF6750A4);
final Color darkSurfaceTint = Color(0xFFD0BCFF);
final Color darkOutlineVariant = Color(0xFF49454F);
final Color darkScrim = Color(0xFF000000);
