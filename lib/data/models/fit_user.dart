import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'fit_body.dart';
import 'fit_program.dart';
import 'fit_workout.dart';

class FitUser extends Equatable {
  final String uid;
  final String name;
  final String avatar;
  final FitProgram program;
  final List<FitWorkout> workouts;
  final List<FitBody> bodyDatas;

  const FitUser(
      {required this.uid,
      required this.name,
      this.avatar = "",
      this.program = FitProgram.empty,
      this.workouts = const [],
      this.bodyDatas = const []});

  static const empty = FitUser(uid: "", name: "");
  bool get isEmpty => this == FitUser.empty;
  bool get isNotEmpty => !isEmpty;

  @override
  List<Object?> get props =>
      [uid, name, avatar, program, ...workouts, ...bodyDatas];

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'avatar': avatar,
      'program': program.toMap(),
      'workouts': workouts.map((x) => x.toMap()).toList(),
      'bodyDatas': bodyDatas.map((x) => x.toMap()).toList(),
    };
  }

  factory FitUser.fromMap(Map<String, dynamic> map) {
    return FitUser(
      uid: map['uid'],
      name: map['name'],
      avatar: map['avatar'],
      program: FitProgram.fromMap(map['program']),
      workouts: map['workouts'] != null
          ? List<FitWorkout>.from(
              map['workouts']?.map((x) => FitWorkout.fromMap(x)))
          : [],
      bodyDatas: map['bodyDatas'] != null
          ? List<FitBody>.from(map['bodyDatas']?.map((x) => FitBody.fromMap(x)))
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory FitUser.fromJson(String source) =>
      FitUser.fromMap(json.decode(source));
}
