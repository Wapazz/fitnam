import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:fitnam/data/models/fit_machine.dart';

class FitWorkout extends Equatable {
  final DateTime date;
  final List<FitMachine> machines;

  const FitWorkout({required this.date, required this.machines});

  @override
  List<Object?> get props => [date, ...machines];

  Map<String, dynamic> toMap() {
    return {
      'date': date.millisecondsSinceEpoch,
      'machines': machines.map((x) => x.toMap()).toList(),
    };
  }

  factory FitWorkout.fromMap(Map<String, dynamic> map) {
    return FitWorkout(
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      machines: List<FitMachine>.from(
          map['machines']?.map((x) => FitMachine.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory FitWorkout.fromJson(String source) =>
      FitWorkout.fromMap(json.decode(source));

  FitWorkout copyWith({
    DateTime? date,
    List<FitMachine>? machines,
  }) {
    return FitWorkout(
      date: date ?? this.date,
      machines: machines ?? this.machines,
    );
  }
}
