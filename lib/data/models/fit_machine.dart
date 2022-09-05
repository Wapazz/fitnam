import 'dart:convert';

class FitMachine {
  final String name;
  final int nbReps;
  final int nbSeries;
  final double weight;

  FitMachine(
      {required this.name,
      required this.nbReps,
      required this.nbSeries,
      required this.weight});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'nbReps': nbReps,
      'nbSeries': nbSeries,
      'weight': weight,
    };
  }

  factory FitMachine.fromMap(Map<String, dynamic> map) {
    return FitMachine(
      name: map['name'],
      nbReps: map['nbReps'],
      nbSeries: map['nbSeries'],
      weight: map['weight'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FitMachine.fromJson(String source) =>
      FitMachine.fromMap(json.decode(source));

  FitMachine copyWith({
    String? name,
    int? nbReps,
    int? nbSeries,
    double? weight,
  }) {
    return FitMachine(
      name: name ?? this.name,
      nbReps: nbReps ?? this.nbReps,
      nbSeries: nbSeries ?? this.nbSeries,
      weight: weight ?? this.weight,
    );
  }
}
