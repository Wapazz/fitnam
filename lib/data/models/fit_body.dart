import 'dart:convert';

import 'package:equatable/equatable.dart';

class FitBody extends Equatable {
  final DateTime date;
  final double weight;
  final double muscularMass;
  final double fatMass;

  const FitBody(
      {required this.date,
      required this.weight,
      required this.muscularMass,
      required this.fatMass});

  @override
  List<Object?> get props => [date, weight, muscularMass, fatMass];

  Map<String, dynamic> toMap() {
    return {
      'date': date.millisecondsSinceEpoch,
      'weight': weight,
      'muscularMass': muscularMass,
      'fatMass': fatMass,
    };
  }

  factory FitBody.fromMap(Map<String, dynamic> map) {
    return FitBody(
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      weight: map['weight'],
      muscularMass: map['muscularMass'],
      fatMass: map['fatMass'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FitBody.fromJson(String source) =>
      FitBody.fromMap(json.decode(source));

  FitBody copyWith({
    DateTime? date,
    double? weight,
    double? muscularMass,
    double? fatMass,
  }) {
    return FitBody(
      date: date ?? this.date,
      weight: weight ?? this.weight,
      muscularMass: muscularMass ?? this.muscularMass,
      fatMass: fatMass ?? this.fatMass,
    );
  }
}
