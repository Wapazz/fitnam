import 'package:fitnam/bloc/current_user/current_user_cubit.dart';
import 'package:fitnam/bloc/workout/workout_cubit.dart';
import 'package:fitnam/data/models/fit_exercise.dart';
import 'package:fitnam/data/start/workout_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/exercise_edition_card.dart';

class ModalExerciseSelect extends StatelessWidget {
  const ModalExerciseSelect({Key? key, required this.topic}) : super(key: key);
  final String topic;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentUserCubit, CurrentUserState>(
      builder: (context, state) {
        bool isKeyboardOpen = !FocusScope.of(context).hasPrimaryFocus;
        List<FitExercise> exercises = state.user.exercises
            .where((element) => element.topic == topic)
            .toList();
        return GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
              // TODO TRIGGER REBUILD
            }
          },
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 100,
            child: Material(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 15),
                Container(
                  height: 6,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(15)),
                ),
                const SizedBox(height: 24),
                Text(
                  "Exercices ${workoutNameFromId(topic)}",
                  style: GoogleFonts.arsenal(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 10),
                exercises.isEmpty
                    ? const Padding(
                        padding:
                            EdgeInsets.only(top: 20.0, left: 16, right: 16),
                        child: Text(
                          "Oh non la liste est vide !\nAjoute un(e) exercice/machine pour ce sujet d'entrainement en cliquant sur le '+'\n\n(Tu peux aussi les preparer a l'avance dans ton profil)",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : SizedBox(
                        height: isKeyboardOpen
                            ? MediaQuery.of(context).size.height - 500
                            : MediaQuery.of(context).size.height - 250,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: exercises.length,
                          itemBuilder: (context, index) {
                            return BlocBuilder<WorkoutCubit, WorkoutState>(
                              builder: (context, workoutState) {
                                return ExerciseEditionCard(
                                  exercise: exercises[index],
                                  isSelected: workoutState.exercises
                                      .map((e) => e.uid)
                                      .toList()
                                      .contains(exercises[index].uid),
                                );
                              },
                            );
                          },
                        ),
                      ),
                IconButton(
                    onPressed: (() {
                      context
                          .read<CurrentUserCubit>()
                          .addExercise(topic, exercises.length + 1);
                    }),
                    icon: const Icon(FontAwesomeIcons.plus)),
                if (isKeyboardOpen) const SizedBox(height: 250),
              ],
            )),
          ),
        );
      },
    );
  }
}
