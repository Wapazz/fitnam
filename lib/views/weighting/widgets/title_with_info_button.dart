import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'info_button.dart';

class TitleWithInfobutton extends StatelessWidget {
  const TitleWithInfobutton({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Text(title,
              style: GoogleFonts.inter(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
          const Spacer(),
          const InfoButton(),
        ],
      ),
    );
  }
}
