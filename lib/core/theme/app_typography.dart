import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTypography {
  static TextStyle get boldTitle => GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        fontSize: 28,
        color: AppColors.black,
      );

  static TextStyle get mediumButton => GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: AppColors.black,
      );

  static TextStyle get regularBody => GoogleFonts.poppins(
        fontWeight: FontWeight.normal,
        fontSize: 14,
        color: AppColors.textGrey,
      );
      
  static TextStyle get inputStyle => GoogleFonts.poppins(
        fontWeight: FontWeight.normal,
        fontSize: 14,
        color: AppColors.black,
      );

  static TextStyle get placeholderStyle => GoogleFonts.poppins(
        fontWeight: FontWeight.normal,
        fontSize: 14,
        color: AppColors.textGrey,
      );
}
