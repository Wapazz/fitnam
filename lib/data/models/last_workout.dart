import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class LastWorkout extends Equatable {
  final String sessionUid;
  final DateTime date;

  const LastWorkout({required this.sessionUid, required this.date});

  @override
  List<Object?> get props => [sessionUid, date];

  Map<String, dynamic> toMap() {
    return {
      'sessionUid': sessionUid,
      'date': FieldValue.serverTimestamp(),
    };
  }

  factory LastWorkout.fromMap(Map<String, dynamic> map) {
    return LastWorkout(
      sessionUid: map['sessionUid'],
      date: map['date'] == null
          ? DateTime(0)
          : DateTime.fromMillisecondsSinceEpoch(
              map['date'].millisecondsSinceEpoch),
    );
  }

  String toJson() => json.encode(toMap());

  factory LastWorkout.fromJson(String source) =>
      LastWorkout.fromMap(json.decode(source));

  LastWorkout copyWith({
    String? sessionUid,
    DateTime? date,
  }) {
    return LastWorkout(
      sessionUid: sessionUid ?? this.sessionUid,
      date: date ?? this.date,
    );
  }
}
