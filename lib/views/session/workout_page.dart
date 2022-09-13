import 'package:fitnam/bloc/workout/workout_cubit.dart';
import 'package:fitnam/data/models/fit_exercise.dart';
import 'package:fitnam/data/models/fit_user.dart';
import 'package:fitnam/data/models/workout_topic.dart';
import 'package:fitnam/views/common/widget/fit_header.dart';
import 'package:fitnam/views/session/modal_exercise/modal_exercise_select.dart';
import 'package:fitnam/views/session/widgets/workout_menu_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'exercises_page.dart';

class WorkoutPage extends StatelessWidget {
  const WorkoutPage(
      {Key? key,
      required this.exercices,
      required this.program,
      required this.selectedIndex,
      required this.user})
      : super(key: key);
  final FitUser user;
  final List<FitExercise> exercices;
  final List<WorkoutTopic> program;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    print("Exercice from workoutpage:");
    print(context.read<WorkoutCubit>().state.exercises);
    var cubit = BlocProvider.of<WorkoutCubit>(context);

    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            "assets/session_bg.png",
            fit: BoxFit.cover,
          ),
        ),
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FitHeader(
                    avatar: "default.png",
                    title: "Yoyo",
                    message:
                        "Voici ton programme du jour. A toi de renseigner les exercices effectués.",
                    hasClosedBottom: true),
                const SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    primary: false,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: program.length,
                    itemBuilder: (BuildContext context, int index) =>
                        WorkoutMenuCard(
                            isSelected: index == selectedIndex,
                            name: program[index].name,
                            index: index),
                  ),
                ),
                ExercisesPage(
                    exercises: exercices
                        .where((element) =>
                            element.topic == program[selectedIndex].name)
                        .toList()),
                Center(
                  child: IconButton(
                    onPressed: () => showCupertinoModalBottomSheet(
                        context: context,
                        builder: (context) => BlocProvider.value(
                              value: cubit,
                              child: ModalExerciseSelect(
                                key: const Key("modal_key"),
                                topic: program[selectedIndex].name,
                              ),
                            )),
                    icon: const Icon(
                      FontAwesomeIcons.plus,
                      color: Color(0xFF8F8F93),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
