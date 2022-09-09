import 'package:fitnam/bloc/weighting/weighting_cubit.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class MassSlider extends StatelessWidget {
  const MassSlider(
      {Key? key,
      required this.mass,
      required this.initialValue,
      required this.onChange})
      : super(key: key);
  final double mass;
  final double initialValue;
  final Function onChange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        child: SleekCircularSlider(
          initialValue: mass == 0 ? initialValue : mass,
          appearance: CircularSliderAppearance(
            customColors: CustomSliderColors(
              trackColor: Colors.grey[800],
              progressBarColor: Theme.of(context).primaryColor,
            ),
          ),
          innerWidget: (value) => Center(
              child: Text(
            "${value.toInt()}%",
            style: GoogleFonts.inter(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 28),
          )),
          onChange: (value) => onChange(value),
        ));
  }
}
