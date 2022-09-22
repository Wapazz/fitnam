import 'package:fitnam/bloc/profile/profile_cubit.dart';
import 'package:fitnam/data/models/fit_exercise.dart';
import 'package:flutter/material.dart';

import 'pages/exercise_page.dart';
import 'pages/schedule_content.dart';
import 'pages/units_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage(
      {Key? key,
      required this.profile,
      required this.exercises,
      required this.padding})
      : super(key: key);
  final EdgeInsets padding;
  final ProfileState profile;
  final List<FitExercise> exercises;

  @override
  Widget build(BuildContext context) {
    double notchSize = padding.top + padding.bottom;
    double headerSize = 160;
    double ctaHeight =
        profile.selectedIndex == 0 || profile.selectedIndex == 8 ? 40 : 0;
    double height =
        MediaQuery.of(context).size.height - notchSize - ctaHeight - headerSize;

    switch (profile.selectedIndex) {
      case 0:
        return SizedBox(
            height: height,
            child: SchedulePage(program: profile.profile.program));
      case 8:
        return SizedBox(
            height: height,
            child: UnitsPage(
                usesEuropeanMetrics: profile.profile.usesEuropeanMetrics));
      default:
        return SizedBox(
            height: height,
            child: ExercisePage(
              selectedIndex: profile.selectedIndex - 1,
              exercises: exercises,
            ));
    }
  }
}
