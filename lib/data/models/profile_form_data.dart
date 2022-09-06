import 'package:equatable/equatable.dart';
import 'package:fitnam/core/constants.dart';
import 'package:fitnam/data/models/workout_topic.dart';

import 'fit_user.dart';

class ProfileFormData extends Equatable {
  final String name;
  final String avatar;
  final List<WorkoutTopic> program;
  final bool usesEuropeanMetrics;

  const ProfileFormData({
    required this.name,
    required this.avatar,
    required this.program,
    required this.usesEuropeanMetrics,
  });

  @override
  List<Object?> get props => [name, avatar, program, usesEuropeanMetrics];

  static const empty = ProfileFormData(
      name: "", avatar: '', program: programData, usesEuropeanMetrics: false);
  bool get isEmpty => this == empty;
  bool get isNotEmpty => !isEmpty;

  ProfileFormData.fromUser(FitUser user)
      : avatar = user.avatar,
        name = user.name,
        program = user.program,
        usesEuropeanMetrics = user.europeanMetrics;

  ProfileFormData copyWith({
    String? name,
    String? avatar,
    List<WorkoutTopic>? program,
    bool? usesEuropeanMetrics,
  }) {
    return ProfileFormData(
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      program: program ?? this.program,
      usesEuropeanMetrics: usesEuropeanMetrics ?? this.usesEuropeanMetrics,
    );
  }
}
