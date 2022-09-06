import 'dart:convert';

import 'package:equatable/equatable.dart';

class WorkoutTopic extends Equatable {
  final String name;
  final String description;
  final String asset;
  final List<bool> schedule;

  const WorkoutTopic(this.name, this.asset, this.schedule, this.description);

  @override
  List<Object?> get props => [name, asset, schedule, description];

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'asset': asset,
      'schedule': schedule,
      'description': description,
    };
  }

  static const empty = WorkoutTopic(
      "", "", [false, false, false, false, false, false, false], "");
  bool get isEmpty => this == empty;
  bool get isNotEmpty => !isEmpty;

  factory WorkoutTopic.fromMap(Map<String, dynamic> map) {
    return WorkoutTopic(
      map['name'],
      map['asset'],
      List<bool>.from(map['schedule']),
      map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory WorkoutTopic.fromJson(String source) =>
      WorkoutTopic.fromMap(json.decode(source));

  WorkoutTopic copyWith({
    String? name,
    String? asset,
    List<bool>? schedule,
    String? description,
  }) {
    return WorkoutTopic(
      name ?? this.name,
      asset ?? this.asset,
      schedule ?? this.schedule,
      description ?? this.description,
    );
  }
}
