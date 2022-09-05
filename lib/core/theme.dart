import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final appTheme = ThemeData(
  textTheme: GoogleFonts.poppinsTextTheme(),
  brightness: Brightness.light,
  primaryColorDark: const Color.fromARGB(255, 204, 161, 51),
  primaryColorLight: const Color.fromARGB(255, 237, 209, 139),
  primaryColor: const Color(0xFFE4BF60),
  colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFE4BF60), secondary: const Color(0xFFE4BF60)),
  scaffoldBackgroundColor: const Color(0xFFF3F7F9),
  inputDecorationTheme: InputDecorationTheme(
    floatingLabelStyle:
        MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
      final Color color = states.contains(MaterialState.error)
          ? Colors.red
          : const Color.fromARGB(255, 204, 161, 51);
      return TextStyle(color: color, letterSpacing: 1.3);
    }),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(255, 204, 161, 51)),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
    ),
  ),
);

const EdgeInsets paddingSmallLateral = EdgeInsets.symmetric(horizontal: 10);
const EdgeInsets paddingMediumLateral = EdgeInsets.symmetric(horizontal: 15);
const EdgeInsets paddingLargeLateral = EdgeInsets.symmetric(horizontal: 20);
