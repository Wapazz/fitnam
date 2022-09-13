import 'package:fitnam/bloc/current_user/current_user_cubit.dart';
import 'package:fitnam/bloc/workout/workout_cubit.dart';
import 'package:fitnam/data/models/fit_exercise.dart';
import 'package:fitnam/data/start/workout_data.dart';
import 'package:fitnam/views/session/modal_exercise/widgets/exercise_edition_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ModalExerciseSelect extends StatelessWidget {
  const ModalExerciseSelect({Key? key, required this.topic}) : super(key: key);
  final String topic;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height - 100,
        child: Material(child: BlocBuilder<CurrentUserCubit, CurrentUserState>(
          builder: (context, state) {
            List<FitExercise> exercises = state.user.exercises
                .where((element) => element.topic == topic)
                .toList();
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 15),
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
                    ? const Text(
                        "Oh non la liste est vide ajoute un exercise a se sujet d'entrainement (tu peux aussi les preparer a l'avance dans ton profil)")
                    : SizedBox(
                        height: MediaQuery.of(context).size.height - 230,
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
                    icon: const Icon(FontAwesomeIcons.plus))
              ],
            );
          },
        )),
      ),
    );
  }
}
