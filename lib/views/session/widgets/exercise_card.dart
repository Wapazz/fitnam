import 'package:fitnam/bloc/current_user/current_user_cubit.dart';
import 'package:fitnam/bloc/workout/workout_cubit.dart';
import 'package:fitnam/core/constants.dart';
import 'package:fitnam/data/models/fit_exercise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper_counter_swipe/stepper_counter_swipe.dart';

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({Key? key, required this.exercise}) : super(key: key);
  final FitExercise exercise;

  _buildStepper(BuildContext context, String title, Function callback,
      int value, int min, int max) {
    return Flexible(
      child: Column(
        children: [
          Text(title, style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 5),
          StepperSwipe(
            stepperValue: value,
            initialValue: value,
            withBackground: false,
            withFastCount: true,
            // withPlusMinus: true,
            speedTransitionLimitCount: 3,
            onChanged: (value) => callback(value),
            firstIncrementDuration: const Duration(milliseconds: 250),
            secondIncrementDuration: const Duration(milliseconds: 100),
            direction: Axis.horizontal,
            dragButtonColor: Theme.of(context).primaryColor,
            counterTextColor: Colors.black,
            maxValue: max,
            minValue: min,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isKilos = context.read<CurrentUserCubit>().state.user.europeanMetrics;

    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              _buildStepper(
                  context,
                  exercise.topic != "idWorkoutCardio"
                      ? "Séries"
                      : "Durée (min)",
                  (value) => context
                      .read<WorkoutCubit>()
                      .editExercise(exercise.copyWith(nbSeries: value)),
                  exercise.nbSeries,
                  1,
                  exercise.topic != "idWorkoutCardio" ? 20 : 999),
              _buildStepper(
                  context,
                  exercise.topic != "idWorkoutCardio"
                      ? "Répétitions"
                      : "Calories",
                  (value) => context
                      .read<WorkoutCubit>()
                      .editExercise(exercise.copyWith(nbReps: value)),
                  exercise.nbReps,
                  1,
                  exercise.topic != "idWorkoutCardio" ? 50 : 999),
              if (exercise.topic != "idWorkoutCardio")
                _buildStepper(
                    context,
                    "Poids",
                    (int value) => context.read<WorkoutCubit>().editExercise(
                        isKilos
                            ? exercise.copyWith(
                                kilos: value.toDouble(),
                                pounds: value * ratioKiloPounds)
                            : exercise.copyWith(
                                pounds: value.toDouble(),
                                kilos: value / ratioKiloPounds)),
                    isKilos ? exercise.kilos.toInt() : exercise.pounds.toInt(),
                    1,
                    999),
            ],
          ),
          const SizedBox(height: 22),
          InkWell(
            onTap: () {
              WorkoutCubit cubit = context.read<WorkoutCubit>();
              cubit.editExercise(exercise.copyWith(isCompleted: true));
              cubit.expandExercise(FitExercise.empty);
              context.read<CurrentUserCubit>().shadowSaveSession(
                  cubit.state.exercises
                      .where((element) => element.isCompleted)
                      .toList(),
                  cubit.state.currentSession);
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor)),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Text(
                  "Terminer l'exercice",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
