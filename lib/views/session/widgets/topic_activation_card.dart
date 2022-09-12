import 'package:fitnam/bloc/workout/workout_cubit.dart';
import 'package:fitnam/data/models/workout_topic.dart';
import 'package:fitnam/data/start/workout_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopicActivationCard extends StatelessWidget {
  const TopicActivationCard(
      {Key? key, required this.topic, required this.isActive})
      : super(key: key);
  final WorkoutTopic topic;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 1.0, color: Color(0xFF636363)),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
          child: Row(
            children: [
              SizedBox(
                width: 60,
                child: Image.asset("assets/workout/${topic.name}.png",
                    fit: BoxFit.contain),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      workoutNameFromId(topic.name),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: isActive
                              ? Theme.of(context).primaryColor
                              : Colors.white),
                    ),
                    Text(
                      workoutDescFromId(topic.name),
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
              Switch(
                  activeColor: Theme.of(context).primaryColor,
                  activeTrackColor:
                      Theme.of(context).primaryColor.withOpacity(0.8),
                  value: isActive,
                  onChanged: (_) {
                    context.read<WorkoutCubit>().changeProgram(topic);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
