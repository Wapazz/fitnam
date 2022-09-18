import 'package:fitnam/bloc/workout/workout_cubit.dart';
import 'package:fitnam/data/models/fit_exercise.dart';
import 'package:fitnam/views/session/widgets/exercise_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExercisesList extends StatelessWidget {
  const ExercisesList({Key? key, required this.exercises}) : super(key: key);
  final List<FitExercise> exercises;

  ExpansionPanel panelCard(FitExercise exercise, bool isExpanded) {
    return ExpansionPanel(
        backgroundColor: const Color(0xFF2C2A26),
        canTapOnHeader: true,
        isExpanded: isExpanded,
        headerBuilder: ((context, isExpanded) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Checkbox(
                    activeColor: Theme.of(context).primaryColor,
                    checkColor: Colors.black,
                    value: exercise.isCompleted,
                    onChanged: (value) => context
                        .read<WorkoutCubit>()
                        .editExercise(exercise.copyWith(isCompleted: value))),
                Text(
                  exercise.name,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        }),
        body: ExerciseCard(exercise: exercise));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutCubit, WorkoutState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ExpansionPanelList(
              // key: UniqueKey(), Cancels anim + State | Without
              expandedHeaderPadding: const EdgeInsets.symmetric(vertical: 8),
              children: exercises
                  .map((e) => panelCard(e, state.expandedExercise == e.uid))
                  .toList(),
              expansionCallback: ((panelIndex, isExpanded) => context
                  .read<WorkoutCubit>()
                  .expandExercise(
                      isExpanded ? FitExercise.empty : exercises[panelIndex]))),
        );
      },
    );
  }
}
