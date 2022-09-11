import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleWithWeight extends StatelessWidget {
  const TitleWithWeight({Key? key, required this.weight, required this.isKilos})
      : super(key: key);
  final double weight;
  final bool isKilos;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Text("Poids",
              style: GoogleFonts.inter(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
          const Spacer(),
          Text("${weight.toStringAsFixed(1)} ${isKilos ? 'kg' : 'lbs'}",
              style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor)),
        ],
      ),
    );
  }
}
