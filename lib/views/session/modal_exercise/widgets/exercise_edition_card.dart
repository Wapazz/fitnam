import 'package:fitnam/bloc/current_user/current_user_cubit.dart';
import 'package:fitnam/bloc/workout/workout_cubit.dart';
import 'package:fitnam/data/models/fit_exercise.dart';
import 'package:fitnam/views/common/widget/fit_dialog.dart';
import 'package:fitnam/views/session/modal_exercise/widgets/dual_textfield.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
          // Expanded(
          //     child: Text(
          //   exercise.name,
          //   style: TextStyle(
          //       color: Colors.white,
          //       fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          //       fontSize: 14),
          // )),
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return FitDialog(
                        message:
                            'Vous allez supprimer un exercice et toutes les donnees associees a celui ci.\nEtes vous sur de vouloir le supprimer ?',
                        onConfirm: () {
                          if (isSelected) {
                            context
                                .read<WorkoutCubit>()
                                .clickExercise(exercise);
                          }
                          context
                              .read<CurrentUserCubit>()
                              .removeExercise(exercise);
                        },
                        title: 'Attention !',
                      );
                    });
              },
              icon: const Icon(
                FontAwesomeIcons.trash,
                size: 16,
                color: Colors.grey,
              ))
        ],
      ),
    );
  }
}
