import 'dart:convert';

import 'package:equatable/equatable.dart';

class FitProgram extends Equatable {
  const FitProgram(
      {required this.cardio,
      required this.abs,
      required this.lowerBody,
      required this.upperBody,
      required this.back});

  final List<bool> cardio;
  final List<bool> abs;
  final List<bool> lowerBody;
  final List<bool> upperBody;
  final List<bool> back;

  static const empty =
      FitProgram(cardio: [], abs: [], lowerBody: [], upperBody: [], back: []);
  bool get isEmpty => this == empty;
  bool get isNotEmpty => !isEmpty;

  @override
  List<Object?> get props => [cardio, abs, lowerBody, upperBody, back];

  Map<String, dynamic> toMap() {
    return {
      'cardio': cardio,
      'abs': abs,
      'lowerBody': lowerBody,
      'upperBody': upperBody,
      'back': back,
    };
  }

  factory FitProgram.fromMap(Map<String, dynamic> map) {
    return FitProgram(
      cardio: List<bool>.from(map['cardio']),
      abs: List<bool>.from(map['abs']),
      lowerBody: List<bool>.from(map['lowerBody']),
      upperBody: List<bool>.from(map['upperBody']),
      back: List<bool>.from(map['back']),
    );
  }

  String toJson() => json.encode(toMap());

  factory FitProgram.fromJson(String source) =>
      FitProgram.fromMap(json.decode(source));

  FitProgram copyWith({
    List<bool>? cardio,
    List<bool>? abs,
    List<bool>? lowerBody,
    List<bool>? upperBody,
    List<bool>? back,
  }) {
    return FitProgram(
      cardio: cardio ?? this.cardio,
      abs: abs ?? this.abs,
      lowerBody: lowerBody ?? this.lowerBody,
      upperBody: upperBody ?? this.upperBody,
      back: back ?? this.back,
    );
  }
}
