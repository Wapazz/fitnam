import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:fitnam/data/models/fit_exercise.dart';
import 'package:fitnam/data/models/workout_topic.dart';

class FitWorkout extends Equatable {
  final DateTime date;
  final List<WorkoutTopic> topics;
  final List<FitExercise> exercises;

  const FitWorkout(
      {required this.date, required this.topics, required this.exercises});

  @override
  List<Object?> get props => [date, ...exercises];

  Map<String, dynamic> toMap() {
    return {
      'date': date.millisecondsSinceEpoch,
      'topics': topics.map((x) => x.toMap()).toList(),
      'exercises': exercises.map((x) => x.toMap()).toList(),
    };
  }

  factory FitWorkout.fromMap(Map<String, dynamic> map) {
    return FitWorkout(
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      topics: List<WorkoutTopic>.from(
          map['topics']?.map((x) => WorkoutTopic.fromMap(x))),
      exercises: List<FitExercise>.from(
          map['exercises']?.map((x) => FitExercise.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory FitWorkout.fromJson(String source) =>
      FitWorkout.fromMap(json.decode(source));

  FitWorkout copyWith({
    DateTime? date,
    List<FitExercise>? exercises,
    List<WorkoutTopic>? topics,
  }) {
    return FitWorkout(
      date: date ?? this.date,
      topics: topics ?? this.topics,
      exercises: exercises ?? this.exercises,
    );
  }
}
