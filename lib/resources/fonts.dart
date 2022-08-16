import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Fonts {
  static TextStyle poppins = GoogleFonts.poppins();
  static TextStyle titleTextTheme = poppins.copyWith(
      fontWeight: FontWeight.w900, color: Colors.white, fontSize: 25.0);

  static TextStyle largeConditionStyle = poppins.copyWith(
      fontWeight: FontWeight.w900, color: Colors.white, fontSize: 60.0);

  static TextStyle detailedWeatherInfoStyle = poppins.copyWith(
      fontWeight: FontWeight.w600, color: Colors.white, fontSize: 20.0);
}
