import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:fitnam/data/models/fit_user.dart';

class FitExercise extends Equatable {
  final String uid;
  final String name;
  final String topic;
  final int nbReps;
  final int nbSeries;
  final double kilos;
  final double pounds;

  const FitExercise({
    required this.name,
    required this.uid,
    required this.nbReps,
    required this.topic,
    required this.nbSeries,
    this.kilos = 0,
    this.pounds = 0,
  });

  static const empty =
      FitExercise(name: '', uid: '', nbReps: 0, topic: '', nbSeries: 0);
  bool get isEmpty => this == empty;
  bool get isNotEmpty => !isEmpty;

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'topic': topic,
      'nbReps': nbReps,
      'nbSeries': nbSeries,
      'kilos': kilos,
      'pounds': pounds,
    };
  }

  factory FitExercise.fromMap(Map<String, dynamic> map) {
    return FitExercise(
      uid: map['uid'],
      name: map['name'],
      nbReps: map['nbReps'],
      nbSeries: map['nbSeries'],
      pounds: map['pounds'].toDouble(),
      kilos: map['kilos'].toDouble(),
      topic: map['topic'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FitExercise.fromJson(String source) =>
      FitExercise.fromMap(json.decode(source));

  FitExercise copyWith({
    String? uid,
    String? name,
    String? topic,
    int? nbReps,
    int? nbSeries,
    double? kilos,
    double? pounds,
  }) {
    return FitExercise(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      topic: topic ?? this.topic,
      nbReps: nbReps ?? this.nbReps,
      nbSeries: nbSeries ?? this.nbSeries,
      kilos: kilos ?? this.kilos,
      pounds: pounds ?? this.pounds,
    );
  }

  @override
  List<Object?> get props => [uid, name, topic];
}
