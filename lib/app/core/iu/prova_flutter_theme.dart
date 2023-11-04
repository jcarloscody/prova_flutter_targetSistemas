import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProvaFlutterTheme {
  static const backGroundSystemDesign = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(27, 77, 100, 1),
        Color.fromRGBO(35, 94, 110, 1),
        Color.fromRGBO(40, 119, 124, 1),
        Color.fromRGBO(44, 139, 135, 1),
        Color.fromRGBO(47, 146, 145, 1),
        Color.fromRGBO(111, 176, 174, 1)
      ],
    ),
  );

  static final styleText = GoogleFonts.roboto(
    color: Colors.white,
    fontSize: 16,
  );
}
