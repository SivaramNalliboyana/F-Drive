import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color bgcolor = Colors.white;
Color textColor = Color(0xffA69CB7);

TextStyle textStyle(double size, [Color color, FontWeight fw]) {
  return GoogleFonts.montserrat(fontSize: size, color: color, fontWeight: fw);
}
