import 'package:fitnam/bloc/current_user/current_user_cubit.dart';
import 'package:fitnam/data/models/fit_exercise.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ModalExerciseCreate extends StatelessWidget {
  const ModalExerciseCreate({Key? key, required this.exercises})
      : super(key: key);
  final List<FitExercise> exercises;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          exercises.isEmpty
              ? Text(
                  "Oh non la liste est vide ajoute un exercise a se sujet d'entrainement (tu peux aussi les preparer a l'avance dans ton profil)")
              : Text(exercises.toString()),
          IconButton(
              onPressed: (() {
                context.read<CurrentUserCubit>().addExercise();
              }),
              icon: Icon(FontAwesomeIcons.plus))
        ],
      ),
    );
  }
}
