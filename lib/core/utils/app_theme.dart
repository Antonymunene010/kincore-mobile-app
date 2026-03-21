import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

class AppTheme {
  AppTheme._();

  /// Light theme – used when system theme is light (default)
  static ThemeData get lightTheme {
    final base = ThemeData.light(useMaterial3: true);
    return base.copyWith(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.scaffoldBgColor,
      primaryColor: AppColors.primaryColor,
      colorScheme: base.colorScheme.copyWith(
        brightness: Brightness.light,
        primary: AppColors.primaryColor,
        secondary: AppColors.orangeColor,
        surface: AppColors.whiteColor,
        background: AppColors.whiteColor,
        onPrimary: AppColors.whiteColor,
        onSecondary: AppColors.whiteColor,
        onSurface: AppColors.blackColor,
        onBackground: AppColors.blackColor,
      ),
      textTheme: _buildTextTheme(brightness: Brightness.light, base: base.textTheme),
      // fontFamily: AppFonts.poppins,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.scaffoldBgColor,
        elevation: 0,
        foregroundColor: AppColors.blackColor,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: AppFonts.poppins,
          fontWeight: AppFonts.semiBold,
          fontSize: 18,
          color: AppColors.blackColor,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.bottomNavColor,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.greyColor,
        type: BottomNavigationBarType.fixed,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.whiteColor,
          textStyle: TextStyle(
            fontFamily: AppFonts.poppins,
            fontWeight: AppFonts.semiBold,
            fontSize: 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primaryColor,
          textStyle: TextStyle(
            fontFamily: AppFonts.poppins,
            fontWeight: AppFonts.medium,
            fontSize: 14,
          ),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return AppColors.primaryColor;
            }
            return AppColors.greyColor;
          },
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.greyColor.withOpacity(0.4)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.greyColor.withOpacity(0.4)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.4),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }

  /// Dark theme – used when system theme is dark
  static ThemeData get darkTheme {
    final base = ThemeData.dark(useMaterial3: true);
    const darkBackground = Color(0xFF050505);
    const darkSurface = Color(0xFF111111);

    return base.copyWith(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkBackground,
      primaryColor: AppColors.primaryColor,
      colorScheme: base.colorScheme.copyWith(
        brightness: Brightness.dark,
        primary: AppColors.primaryColor,
        secondary: AppColors.orangeColor,
        surface: darkSurface,
        background: darkBackground,
        onPrimary: AppColors.whiteColor,
        onSecondary: AppColors.whiteColor,
        onSurface: AppColors.whiteColor,
        onBackground: AppColors.whiteColor,
      ),
      textTheme: _buildTextTheme(brightness: Brightness.dark, base: base.textTheme),
      // fontFamily: AppFonts.poppins,
      appBarTheme: AppBarTheme(
        backgroundColor: darkSurface,
        elevation: 0,
        foregroundColor: AppColors.whiteColor,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: AppFonts.poppins,
          fontWeight: AppFonts.semiBold,
          fontSize: 18,
          color: AppColors.whiteColor,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: darkSurface,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.greyColor,
        type: BottomNavigationBarType.fixed,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.whiteColor,
          textStyle: TextStyle(
            fontFamily: AppFonts.poppins,
            fontWeight: AppFonts.semiBold,
            fontSize: 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primaryColor,
          textStyle: TextStyle(
            fontFamily: AppFonts.poppins,
            fontWeight: AppFonts.medium,
            fontSize: 14,
          ),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return AppColors.primaryColor;
            }
            return AppColors.greyColor;
          },
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.greyColor.withOpacity(0.5)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.greyColor.withOpacity(0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.4),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }

  static TextTheme _buildTextTheme({
    required Brightness brightness,
    required TextTheme base,
  }) {
    final bool isLight = brightness == Brightness.light;
    final Color primaryTextColor = isLight ? AppColors.blackColor : AppColors.whiteColor;
    // final Color secondaryTextColor = AppColors.whiteColor;

    return base.copyWith(
      displayLarge: base.displayLarge?.copyWith(
        fontFamily: AppFonts.poppins,
        fontWeight: AppFonts.bold,
        color: primaryTextColor,
      ),
      displayMedium: base.displayMedium?.copyWith(
        fontFamily: AppFonts.poppins,
        fontWeight: AppFonts.bold,
        color: primaryTextColor,
      ),
      headlineMedium: base.headlineMedium?.copyWith(
        fontFamily: AppFonts.poppins,
        fontWeight: AppFonts.semiBold,
        color: primaryTextColor,
      ),
      titleLarge: base.titleLarge?.copyWith(
        fontFamily: AppFonts.poppins,
        fontWeight: AppFonts.semiBold,
        color: primaryTextColor,
      ),
      bodyLarge: base.bodyLarge?.copyWith(
        fontFamily: AppFonts.poppins,
        fontWeight: AppFonts.regular,
        color: primaryTextColor,
      ),
      bodyMedium: base.bodyMedium?.copyWith(
        fontFamily: AppFonts.poppins,
        fontWeight: AppFonts.regular,
        color: primaryTextColor,
      ),
      labelLarge: base.labelLarge?.copyWith(
        fontFamily: AppFonts.poppins,
        fontWeight: AppFonts.medium,
        color: primaryTextColor,
      ),
    );
  }
}

