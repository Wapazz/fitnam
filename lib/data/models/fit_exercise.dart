import 'dart:convert';

class FitExercise {
  final String name;
  final String topic;
  final int nbReps;
  final int nbSeries;
  final double weight;

  FitExercise(
      {required this.name,
      required this.nbReps,
      required this.topic,
      required this.nbSeries,
      required this.weight});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'topic': topic,
      'nbReps': nbReps,
      'nbSeries': nbSeries,
      'weight': weight,
    };
  }

  factory FitExercise.fromMap(Map<String, dynamic> map) {
    return FitExercise(
      name: map['name'],
      nbReps: map['nbReps'],
      nbSeries: map['nbSeries'],
      weight: map['weight'],
      topic: map['topic'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FitExercise.fromJson(String source) =>
      FitExercise.fromMap(json.decode(source));

  FitExercise copyWith({
    String? name,
    String? topic,
    int? nbReps,
    int? nbSeries,
    double? weight,
  }) {
    return FitExercise(
      name: name ?? this.name,
      topic: topic ?? this.topic,
      nbReps: nbReps ?? this.nbReps,
      nbSeries: nbSeries ?? this.nbSeries,
      weight: weight ?? this.weight,
    );
  }
}
