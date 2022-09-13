import 'package:fitnam/bloc/current_user/current_user_cubit.dart';
import 'package:fitnam/bloc/workout/workout_cubit.dart';
import 'package:fitnam/data/models/fit_exercise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DualTextField extends StatefulWidget {
  const DualTextField({Key? key, required this.exercise, required this.isBold})
      : super(key: key);
  final FitExercise exercise;
  final bool isBold;

  @override
  State<DualTextField> createState() => _DualTextFieldState();
}

class _DualTextFieldState extends State<DualTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.exercise.name);
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: ((value) {
        if (!value) {
          if (widget.isBold) {
            // Change workoutCubit Data if already in the list
            context.read<WorkoutCubit>().removeExercise(widget.exercise);
          }
          // Change CurrentUserCubit Data
          context
              .read<CurrentUserCubit>()
              .renameExercise(widget.exercise, _controller.text);
        }
      }),
      child: TextField(
        controller: _controller,
        style: TextStyle(
            color: Colors.white,
            fontWeight: widget.isBold ? FontWeight.bold : FontWeight.normal),
        decoration: const InputDecoration(
            border: InputBorder.none, focusedBorder: InputBorder.none),
      ),
    );
  }
}
