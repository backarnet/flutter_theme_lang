import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final font = GoogleFonts.cairo().fontFamily;

final themes = {
  "Green Light":
      newTheme(Colors.green, brightness: Brightness.light, fontFamily: font),
  "Green Dark":
      newTheme(Colors.green, brightness: Brightness.dark, fontFamily: font),
  "Red Light":
      newTheme(Colors.red, brightness: Brightness.light, fontFamily: font),
  "Red Dark":
      newTheme(Colors.red, brightness: Brightness.dark, fontFamily: font),
  "Blue Light":
      newTheme(Colors.blue, brightness: Brightness.light, fontFamily: font),
  "Blue Dark":
      newTheme(Colors.blue, brightness: Brightness.dark, fontFamily: font),
  "Yellow Light":
      newTheme(Colors.amber, brightness: Brightness.light, fontFamily: font),
  "Yellow Dark":
      newTheme(Colors.amber, brightness: Brightness.dark, fontFamily: font),
};

ThemeData newTheme(Color color, {Brightness? brightness, String? fontFamily}) {
  return ThemeData(
    primaryColor: color,
    brightness: brightness,
    useMaterial3: true,
    fontFamily: fontFamily,
    appBarTheme: AppBarTheme(
      elevation: 2,
      shadowColor: Colors.black87,
      backgroundColor: color,
      foregroundColor:
          color.computeLuminance() > 0.5 ? Colors.black87 : Colors.white70,
    ),
  );
}
