// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

class AppTheme {
  AppTheme._();

  static final Color _iconColor = Colors.blueAccent.shade200;
  static const Color _lightPrimaryColor = Color(0xFF546E7A);
  static const Color _lightPrimaryVariantColor = Colors.white;
  static const Color _lightSecondaryColor = Colors.green;
  static const Color _lightOnPrimaryColor = Colors.black;

  static const Color _darkPrimaryColor = Colors.white24;
  static const Color _darkPrimaryVariantColor = Colors.black;
  static const Color _darkSecondaryColor = Colors.white;
  static const Color _darkOnPrimaryColor = Colors.white;

  static final ThemeData lightTheme = ThemeData(
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
            color: _darkSecondaryColor,
            fontFamily: GoogleFonts.rubik().fontFamily,
            fontWeight: FontWeight.bold,
            fontSize: 24),
        color: _lightPrimaryVariantColor,
        iconTheme: IconThemeData(color: _lightOnPrimaryColor),
      ),
      colorScheme: ColorScheme.light(
        primary: _lightPrimaryColor,
        secondary: _lightSecondaryColor,
        onPrimary: _lightOnPrimaryColor,
      ),
      iconTheme: IconThemeData(
        color: _iconColor,
      ),
      textTheme: _lightTextTheme,
      dividerTheme: DividerThemeData(color: Colors.black12));

  static final TextTheme _lightTextTheme = TextTheme(
    headline1: _lightScreenHeading1TextStyle,
    headline2: _noteTextStyle,
  );

 

  

  static final TextStyle ttlStyl14B = TextStyle(
      color: appColor.txtTitle,
      fontFamily: GoogleFonts.rubik().fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w800);

  static final TextStyle ttlStyl12 = TextStyle(
    color: appColor.txtTitle,
    fontFamily: GoogleFonts.rubik().fontFamily,
    fontSize: 12,
  );

  
  static final TextStyle ttlWhiteStyl14 = TextStyle(
      color: appColor.white,
      fontFamily: GoogleFonts.rubik().fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w800);

  

 

 

 
 
 

  static final TextStyle _lightScreenHeading1TextStyle = TextStyle(
    fontSize: 26.0,
    fontWeight: FontWeight.bold,
    color: _lightOnPrimaryColor,
    fontFamily: GoogleFonts.rubik().fontFamily,
  );
  

  static final TextStyle _noteTextStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: _lightOnPrimaryColor,
    fontFamily: GoogleFonts.rubik().fontFamily,
  );

  
}
