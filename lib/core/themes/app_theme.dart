import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class AppTheme {
  AppTheme._();

  //========================
  // Dark Theme
  //========================

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      scaffoldBackgroundColor: AppColors.background,

      colorScheme: const ColorScheme.dark(
        primary: AppColors.yellow,
        secondary: AppColors.yellow,
        surface: AppColors.card,
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
      ),

      textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme)
          .copyWith(
            displayLarge: GoogleFonts.poppins(
              fontSize: 56,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),

            displayMedium: GoogleFonts.poppins(
              fontSize: 46,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),

            headlineLarge: GoogleFonts.poppins(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),

            headlineMedium: GoogleFonts.poppins(
              fontSize: 34,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
            ),

            titleLarge: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),

            titleMedium: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.grey,
            ),

            labelLarge: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.yellow,
              letterSpacing: 2,
            ),

            bodyLarge: GoogleFonts.poppins(
              fontSize: 18,
              color: AppColors.grey,
              height: 1.8,
            ),

            bodyMedium: GoogleFonts.poppins(
              fontSize: 16,
              color: AppColors.grey,
              height: 1.7,
            ),

            bodySmall: GoogleFonts.poppins(fontSize: 14, color: AppColors.grey),
          ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.yellow,
          foregroundColor: Colors.black,
          minimumSize: const Size(170, 60),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.white,
          side: const BorderSide(color: AppColors.white),
          minimumSize: const Size(170, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),

      cardTheme: CardThemeData(
        color: AppColors.card,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
    );
  }

  //========================
  // Light Theme
  //========================

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      scaffoldBackgroundColor: AppColors.lightBackground,

      colorScheme: const ColorScheme.light(
        primary: AppColors.yellow,
        secondary: AppColors.yellow,
        surface: AppColors.lightCard,
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
      ),

      textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme)
          .copyWith(
            displayLarge: GoogleFonts.poppins(
              fontSize: 56,
              fontWeight: FontWeight.bold,
              color: AppColors.lightText,
            ),

            displayMedium: GoogleFonts.poppins(
              fontSize: 46,
              fontWeight: FontWeight.bold,
              color: AppColors.lightText,
            ),

            headlineLarge: GoogleFonts.poppins(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: AppColors.lightText,
            ),

            headlineMedium: GoogleFonts.poppins(
              fontSize: 34,
              fontWeight: FontWeight.w700,
              color: AppColors.lightText,
            ),

            titleLarge: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppColors.lightText,
            ),

            titleMedium: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade700,
            ),

            labelLarge: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.yellow,
              letterSpacing: 2,
            ),

            bodyLarge: GoogleFonts.poppins(
              fontSize: 18,
              color: Colors.grey.shade800,
              height: 1.8,
            ),

            bodyMedium: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.grey.shade700,
              height: 1.7,
            ),

            bodySmall: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey.shade600,
            ),
          ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.yellow,
          foregroundColor: Colors.black,
          minimumSize: const Size(170, 60),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.lightText,
          side: BorderSide(color: Colors.grey.shade400),
          minimumSize: const Size(170, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),

      cardTheme: CardThemeData(
        color: AppColors.lightCard,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
    );
  }
}
