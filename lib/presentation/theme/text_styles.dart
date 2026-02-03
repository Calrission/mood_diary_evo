import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class TS {
  static TextStyle title = GoogleFonts.nunito(
    fontSize: 18,
    fontWeight: FontWeight.bold
  );

  static TextStyle tab = GoogleFonts.nunito(
    fontSize: 12,
    fontWeight: FontWeight.w500
  );

  static TextStyle calendarWeekdays = GoogleFonts.nunito(
    fontSize: 12,
    fontWeight: FontWeight.w600
  );

  static TextStyle calendarYear = GoogleFonts.nunito(
    fontSize: 16,
    fontWeight: FontWeight.bold
  );

  static TextStyle calendarMonth = GoogleFonts.nunito(
    fontSize: 24,
    fontWeight: FontWeight.bold
  );

  static TextStyle calendarNumber = GoogleFonts.nunito(
    fontSize: 18,
    fontWeight: FontWeight.w500
  );

  static TextStyle calendarToday = GoogleFonts.nunito(
    fontSize: 18,
    fontWeight: FontWeight.w600
  );

  static TextStyle titleBlock = GoogleFonts.nunito(
    fontSize: 16,
    fontWeight: FontWeight.w800
  );

  static TextStyle label = GoogleFonts.nunito(
    fontSize: 12,
  );

  static TextStyle text = GoogleFonts.nunito(
    fontSize: 14,
  );

  static TextStyle button = GoogleFonts.nunito(
    fontSize: 20,
  );
}

extension InContext on TextStyle {
  TextStyle use(Color color) => copyWith(color: color);
}