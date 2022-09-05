import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:fitnam/data/models/fit_program.dart';

class OnboardingData extends Equatable {
  final String name;
  final String avatar;
  final FitProgram program;
  const OnboardingData({
    required this.name,
    required this.avatar,
    required this.program,
  });

  @override
  List<Object?> get props => [name, avatar, program];

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'avatar': avatar,
      'program': program.toMap(),
    };
  }

  factory OnboardingData.fromMap(Map<String, dynamic> map) {
    return OnboardingData(
      name: map['name'],
      avatar: map['avatar'],
      program: FitProgram.fromMap(map['program']),
    );
  }

  String toJson() => json.encode(toMap());

  factory OnboardingData.fromJson(String source) =>
      OnboardingData.fromMap(json.decode(source));

  OnboardingData copyWith({
    String? name,
    String? avatar,
    FitProgram? program,
  }) {
    return OnboardingData(
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      program: program ?? this.program,
    );
  }
}
