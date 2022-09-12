import 'package:fitnam/data/models/fit_exercise.dart';
import 'package:flutter/material.dart';

class ExercisesPage extends StatelessWidget {
  const ExercisesPage({Key? key, required this.exercises}) : super(key: key);
  final List<FitExercise> exercises;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: exercises.length,
      itemBuilder: ((context, index) {
        return Text(
          exercises[index].name,
          style: TextStyle(color: Colors.white),
        );
      }),
    );
  }
}
