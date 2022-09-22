import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'fit_user.dart';

class WeightsList extends Equatable {
  final List<FitWeighting> data;

  const WeightsList(this.data);

  @override
  List<Object?> get props => [data];

  Map<String, dynamic> toMap() {
    return {
      'data': data.map((x) => x.toMap()).toList(),
    };
  }

  factory WeightsList.fromMap(Map<String, dynamic> map) {
    return WeightsList(
      List<FitWeighting>.from(map['data']?.map((x) => FitWeighting.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeightsList.fromJson(String source) =>
      WeightsList.fromMap(json.decode(source));
}

class FitWeighting extends Equatable {
  final double kilos;
  final double pounds;
  final double muscularMass;
  final double fatMass;
  final DateTime date;

  const FitWeighting({
    required this.kilos,
    required this.pounds,
    required this.muscularMass,
    required this.fatMass,
    required this.date,
  });

  double weight(FitUser user) => user.europeanMetrics ? kilos : pounds;

  @override
  List<Object?> get props => [kilos, pounds, muscularMass, fatMass];

  static final empty = FitWeighting(
      pounds: 0, kilos: 0, muscularMass: 0, fatMass: 0, date: DateTime(0));
  bool get isEmpty => this == empty;
  bool get isNotEmpty => !isEmpty;

  FitWeighting copyWith({
    double? kilos,
    double? pounds,
    double? muscularMass,
    double? fatMass,
    DateTime? date,
  }) {
    return FitWeighting(
      kilos: kilos ?? this.kilos,
      pounds: pounds ?? this.pounds,
      muscularMass: muscularMass ?? this.muscularMass,
      fatMass: fatMass ?? this.fatMass,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'kilos': kilos,
      'pounds': pounds,
      'muscularMass': muscularMass,
      'fatMass': fatMass,
      'date': FieldValue.serverTimestamp()
    };
  }

  factory FitWeighting.fromMap(Map<String, dynamic> map) {
    return FitWeighting(
        kilos: map['kilos'],
        pounds: map['pounds'],
        muscularMass: map['muscularMass'],
        fatMass: map['fatMass'],
        date: map['date'] == null
            ? DateTime(0)
            : DateTime.fromMillisecondsSinceEpoch(
                map['date'].millisecondsSinceEpoch));
  }

  String toJson() => json.encode(toMap());

  factory FitWeighting.fromJson(String source) =>
      FitWeighting.fromMap(json.decode(source));
}
