import 'dart:convert';

import 'package:equatable/equatable.dart';

class WorkoutTopic extends Equatable {
  final String name;
  final List<bool> schedule;

  const WorkoutTopic(this.name, this.schedule);

  @override
  List<Object?> get props => [name, schedule];

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'schedule': schedule,
    };
  }

  static const empty =
      WorkoutTopic("", [false, false, false, false, false, false, false]);
  bool get isEmpty => this == empty;
  bool get isNotEmpty => !isEmpty;

  factory WorkoutTopic.fromMap(Map<String, dynamic> map) {
    return WorkoutTopic(
      map['name'],
      List<bool>.from(map['schedule']),
    );
  }

  String toJson() => json.encode(toMap());

  factory WorkoutTopic.fromJson(String source) =>
      WorkoutTopic.fromMap(json.decode(source));

  WorkoutTopic copyWith({
    String? name,
    List<bool>? schedule,
  }) {
    return WorkoutTopic(
      name ?? this.name,
      schedule ?? this.schedule,
    );
  }
}
