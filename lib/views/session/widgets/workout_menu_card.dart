import 'package:fitnam/bloc/workout/workout_cubit.dart';
import 'package:fitnam/data/start/workout_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutMenuCard extends StatelessWidget {
  const WorkoutMenuCard(
      {Key? key,
      required this.isSelected,
      required this.name,
      required this.index})
      : super(key: key);
  final bool isSelected;
  final String name;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.read<WorkoutCubit>().changeIndex(index),
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: isSelected
                    ? BorderSide(
                        color: Theme.of(context).primaryColor, width: 3)
                    : BorderSide.none)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Text(
            workoutNameFromId(name),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
