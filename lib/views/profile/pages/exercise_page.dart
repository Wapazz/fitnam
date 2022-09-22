import 'package:fitnam/bloc/current_user/current_user_cubit.dart';
import 'package:fitnam/data/models/fit_exercise.dart';
import 'package:fitnam/data/start/workout_data.dart';
import 'package:fitnam/views/common/widget/dual_textfield.dart';
import 'package:fitnam/views/common/widget/fit_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({Key? key, required this.exercise}) : super(key: key);
  final FitExercise exercise;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
      child: Container(
        color: Colors.grey[800],
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                child: DualTextField(
                  exercise: exercise,
                  isBold: false,
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return FitDialog(
                          message:
                              'Vous allez supprimer un exercice et toutes les données associées à celui-ci.\n\nÊtes-vous sur de vouloir le supprimer ?',
                          onConfirm: () => context
                              .read<CurrentUserCubit>()
                              .removeExercise(exercise),
                          title: 'Attention !',
                          confirmTitle: 'Suppprimer',
                        );
                      });
                },
                icon: const Icon(
                  FontAwesomeIcons.trash,
                  size: 16,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}

class ExercisePage extends StatelessWidget {
  const ExercisePage(
      {Key? key, required this.exercises, required this.selectedIndex})
      : super(key: key);
  final int selectedIndex;
  final List<FitExercise> exercises;

  @override
  Widget build(BuildContext context) {
    List<FitExercise> currentExercises = exercises
        .where((element) => element.topic == programData[selectedIndex].name)
        .toList();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ...currentExercises
              .map((e) => Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: ExerciseCard(exercise: e)))
              .toList(),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: IconButton(
                    onPressed: () => context
                        .read<CurrentUserCubit>()
                        .addExercise(programData[selectedIndex].name,
                            currentExercises.length + 1),
                    icon: const Icon(FontAwesomeIcons.plus)),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
