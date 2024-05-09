import 'package:etask/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appThemeData = ThemeData(
  colorScheme: const ColorScheme(
    primary: AppColors.primaryColor,
    secondary: AppColors.accentColor,
    surface: Colors.white,
    background: Color(0xFFF5F5F5),
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.black,
    onBackground: Colors.black,
    onError: Colors.white,
    brightness: Brightness.light,
  ),
  fontFamily: GoogleFonts.dmSans().fontFamily,
);
