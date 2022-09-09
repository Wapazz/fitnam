import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

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
  final double weight;
  final double muscularMass;
  final double fatMass;
  final DateTime date;

  const FitWeighting({
    required this.weight,
    required this.muscularMass,
    required this.fatMass,
    required this.date,
  });

  @override
  List<Object?> get props => [weight, muscularMass, fatMass];

  static final empty =
      FitWeighting(weight: 0, muscularMass: 0, fatMass: 0, date: DateTime(0));
  bool get isEmpty => this == empty;
  bool get isNotEmpty => !isEmpty;

  FitWeighting copyWith({
    double? weight,
    double? muscularMass,
    double? fatMass,
    DateTime? date,
  }) {
    return FitWeighting(
      weight: weight ?? this.weight,
      muscularMass: muscularMass ?? this.muscularMass,
      fatMass: fatMass ?? this.fatMass,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'weight': weight,
      'muscularMass': muscularMass,
      'fatMass': fatMass,
      'date': FieldValue.serverTimestamp()
    };
  }

  factory FitWeighting.fromMap(Map<String, dynamic> map) {
    return FitWeighting(
        weight: map['weight'],
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
