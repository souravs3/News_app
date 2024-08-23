import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/view/config/colors.dart';

var lightTheme = ThemeData(
  useMaterial3: true,
  inputDecorationTheme: InputDecorationTheme(
    fillColor: lightBgColor,
    filled: true,
    enabledBorder: InputBorder.none,
    prefixIconColor: lightLableColor,
    labelStyle: GoogleFonts.poppins(
      fontSize: 15,
      color: lightFontColor,
      fontWeight: FontWeight.w500,
    ),
    hintStyle: GoogleFonts.poppins(
      fontSize: 15,
      color: lightFontColor,
      fontWeight: FontWeight.w500,
    ),
  ),
  colorScheme: ColorScheme.light(
    brightness: Brightness.light,
    // ignore: deprecated_member_use
    surfaceContainer: Colors.deepOrange[200],
    primaryContainer: lightDivColor,
    onPrimaryContainer: lightFontColor,
    secondaryContainer: lightLableColor,
    primary: lightPrimaryColor,
  ),
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.poppins(
      fontSize: 24,
      color: lightFontColor,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: 20,
      color: lightFontColor,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: GoogleFonts.poppins(
      fontSize: 15,
      color: lightFontColor,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: GoogleFonts.poppins(
      fontSize: 16,
      color: lightFontColor,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 15,
      color: lightFontColor,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: GoogleFonts.poppins(
      fontSize: 13,
      color: lightFontColor,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: GoogleFonts.poppins(
      fontSize: 13,
      color: lightLableColor,
      fontWeight: FontWeight.w300,
    ),
  ),
);

var darkTheme = ThemeData(
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    backgroundColor: darkDivColor,
    foregroundColor: darkFontColor,
    elevation: 0,
    iconTheme: IconThemeData(
      color: darkFontColor,
    ),
    titleTextStyle: GoogleFonts.poppins(
      fontSize: 20,
      color: darkFontColor,
      fontWeight: FontWeight.w600,
    ),
  ),
  colorScheme: ColorScheme.dark(
    brightness: Brightness.dark,
    surfaceContainer: Colors.deepOrange,
    primaryContainer: darkDivColor,
    onPrimaryContainer: darkFontColor,
    secondaryContainer: darkLableColor,
    primary: darkPrimaryColor,
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: darkBgColor,
    filled: true,
    enabledBorder: InputBorder.none,
    prefixIconColor: darkLableColor,
    labelStyle: GoogleFonts.poppins(
      fontSize: 15,
      color: darkFontColor,
      fontWeight: FontWeight.w500,
    ),
    hintStyle: GoogleFonts.poppins(
      fontSize: 15,
      color: darkFontColor,
      fontWeight: FontWeight.w500,
    ),
  ),
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.poppins(
      fontSize: 24,
      color: darkFontColor,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: 20,
      color: darkFontColor,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: GoogleFonts.poppins(
      fontSize: 15,
      color: darkFontColor,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: GoogleFonts.poppins(
      fontSize: 15,
      color: darkFontColor,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 15,
      color: darkFontColor,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: GoogleFonts.poppins(
      fontSize: 13,
      color: darkFontColor,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: GoogleFonts.poppins(
      fontSize: 13,
      color: darkLableColor,
      fontWeight: FontWeight.w300,
    ),
  ),
);
