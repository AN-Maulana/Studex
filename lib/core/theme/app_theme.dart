import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Pastikan sudah tambah di pubspec.yaml
import 'app_colors.dart';
import 'app_typography.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      // 1. Set Poppins sebagai font utama secara global
      fontFamily: GoogleFonts.poppins().fontFamily,
      
      primaryColor: AppColors.primaryLime,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: ColorScheme.light(
        primary: AppColors.primaryLime,
        surface: AppColors.background, // 'background' sudah deprecated di Flutter versi baru, gunakan surface
        onPrimary: AppColors.black,
      ),

      // 2. Integrasikan Poppins ke dalam TextTheme yang Anda buat
      textTheme: GoogleFonts.poppinsTextTheme(
        TextTheme(
          displayLarge: AppTypography.boldTitle,
          labelLarge: AppTypography.mediumButton,
          bodyMedium: AppTypography.regularBody,
        ),
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.black),
        // Pastikan title di AppBar juga otomatis Poppins
        titleTextStyle: TextStyle(
          color: AppColors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}