import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:fitnam/data/models/fit_exercise.dart';
import 'package:fitnam/data/models/fit_weighting.dart';
import 'package:fitnam/data/start/workout_data.dart';

import 'workout_topic.dart';

class FitUser extends Equatable {
  final String uid;
  final String name;
  final String avatar;
  final List<WorkoutTopic> program;
  final FitWeighting? lastWeighting;
  final DateTime? lastWorkout;
  final bool europeanMetrics;
  final List<FitExercise> exercises;

  const FitUser({
    required this.uid,
    required this.name,
    required this.avatar,
    this.program = programData,
    this.lastWeighting,
    this.lastWorkout,
    this.exercises = const [],
    this.europeanMetrics = true,
  });

  static const empty = FitUser(uid: "", name: "", avatar: "");
  bool get isEmpty => this == empty;
  bool get isNotEmpty => !isEmpty;

  String get firstName => name.split(' ').first;

  @override
  List<Object?> get props => [
        uid,
        name,
        avatar,
        program,
        lastWeighting,
        exercises,
        lastWorkout,
        europeanMetrics,
      ];

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'avatar': avatar,
      'exercises':
          exercises.isNotEmpty ? exercises.map((e) => e.toMap()).toList() : [],
      'program': program.isNotEmpty
          ? program.map((x) => x.toMap()).toList()
          : programData,
      'lastWeighting': lastWeighting?.toMap(),
      'lastWorkout': lastWorkout?.millisecondsSinceEpoch,
      'europeanMetrics': europeanMetrics,
    };
  }

  factory FitUser.fromMap(Map<String, dynamic> map) {
    return FitUser(
      uid: map['uid'],
      name: map['name'],
      avatar: map['avatar'],
      exercises: map['exercises'] != null
          ? List<FitExercise>.from(
              map['exercises']?.map((x) => FitExercise.fromMap(x)))
          : [],
      program: map['program'] != null
          ? List<WorkoutTopic>.from(
              map['program']?.map((x) => WorkoutTopic.fromMap(x)))
          : programData,
      lastWeighting: map['lastWeighting'] != null
          ? FitWeighting.fromMap(map['lastWeighting'])
          : null,
      lastWorkout: map['lastWorkout'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['lastWorkout'])
          : null,
      europeanMetrics: map['europeanMetrics'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FitUser.fromJson(String source) =>
      FitUser.fromMap(json.decode(source));

  FitUser copyWith({
    String? uid,
    String? name,
    String? avatar,
    List<WorkoutTopic>? program,
    List<FitExercise>? exercises,
    FitWeighting? lastWeighting,
    DateTime? lastWorkout,
    bool? europeanMetrics,
  }) {
    return FitUser(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      program: program ?? this.program,
      exercises: exercises ?? this.exercises,
      lastWeighting: lastWeighting ?? this.lastWeighting,
      lastWorkout: lastWorkout ?? this.lastWorkout,
      europeanMetrics: europeanMetrics ?? this.europeanMetrics,
    );
  }
}
