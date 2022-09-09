import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FitMotto extends StatelessWidget {
  const FitMotto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Make yourself stronger than your excuses".toUpperCase(),
      textAlign: TextAlign.center,
      style: GoogleFonts.arsenal(
        color: Theme.of(context).primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 40,
        shadows: const [
          Shadow(
            offset: Offset(2.0, 2.0),
            blurRadius: 4.0,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
