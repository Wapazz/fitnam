import 'package:fitnam/bloc/workout/workout_cubit.dart';
import 'package:fitnam/data/models/fit_exercise.dart';
import 'package:fitnam/views/common/widget/dual_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExerciseEditionCard extends StatelessWidget {
  const ExerciseEditionCard(
      {Key? key, required this.exercise, required this.isSelected})
      : super(key: key);
  final FitExercise exercise;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Row(
        children: [
          Switch(
              activeTrackColor: Theme.of(context).primaryColor.withOpacity(0.8),
              activeColor: Theme.of(context).primaryColor,
              value: isSelected,
              onChanged: (_) =>
                  context.read<WorkoutCubit>().clickExercise(exercise)),
          const SizedBox(width: 15),
          Expanded(
            child: DualTextField(
              exercise: exercise,
              isBold: isSelected,
            ),
          ),
        ],
      ),
    );
  }
}
