import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class MassSlider extends StatelessWidget {
  const MassSlider(
      {Key? key,
      required this.mass,
      required this.initialValue,
      required this.onChange,
      required this.max,
      required this.min})
      : super(key: key);
  final double mass;
  final double initialValue;
  final Function onChange;
  final double max;
  final double min;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        child: SleekCircularSlider(
          min: min,
          max: max,
          initialValue: mass == 0 ? initialValue : mass,
          appearance: CircularSliderAppearance(
            customColors: CustomSliderColors(
              trackColor: Colors.grey[800],
              progressBarColor: Theme.of(context).primaryColor,
            ),
          ),
          innerWidget: (value) => Center(
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: "${value.toInt()}",
                  style: GoogleFonts.inter(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 28),
                ),
                TextSpan(
                  text:
                      ".${int.tryParse(value.toString().split('.')[1].substring(0, 1))}%",
                  style: GoogleFonts.inter(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )
              ]),
            ),
          ),
          onChange: (value) => onChange(value),
        ));
  }
}
