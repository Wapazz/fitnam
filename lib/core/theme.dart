import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final appTheme = ThemeData(
  textTheme: GoogleFonts.poppinsTextTheme()
      .copyWith(bodySmall: const TextStyle(color: Colors.white)),
  brightness: Brightness.dark,
  primaryColorDark: const Color(0xFFFEE666),
  primaryColorLight: const Color.fromARGB(255, 237, 209, 139),
  primaryColor: const Color(0xFFFEE666),
  colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFFEE666),
      secondary: const Color(0xFFFEE666),
      brightness: Brightness.dark),
  scaffoldBackgroundColor: const Color(0xFF141313),
  inputDecorationTheme: InputDecorationTheme(
    floatingLabelStyle:
        MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
      final Color color = states.contains(MaterialState.error)
          ? Colors.red
          : const Color(0xFFFEE666);
      return TextStyle(color: color, letterSpacing: 1.3);
    }),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFFEE666)),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
    ),
  ),
);

const EdgeInsets paddingSmallLateral = EdgeInsets.symmetric(horizontal: 10);
const EdgeInsets paddingMediumLateral = EdgeInsets.symmetric(horizontal: 15);
const EdgeInsets paddingLargeLateral = EdgeInsets.symmetric(horizontal: 20);
