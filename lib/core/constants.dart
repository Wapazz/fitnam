import 'package:fitnam/data/models/workout_topic.dart';

const int networkPageSize = 10;
const double filterMenuHeight = 50.0;

const List<WorkoutTopic> programData = [
  WorkoutTopic(
      "Bras & épaules",
      "asset",
      [false, false, false, false, false, false, false],
      "Biceps, triceps, quadriceps, épaules"),
  WorkoutTopic("Pectoraux", "asset",
      [false, false, false, false, false, false, false], "Pectoraux"),
  WorkoutTopic("Jambes", "asset",
      [false, false, false, false, false, false, false], "Ischios, mollets"),
  WorkoutTopic("Abdos", "asset",
      [false, false, false, false, false, false, false], "Abdominaux, Crunch"),
  WorkoutTopic("Dos", "asset",
      [false, false, false, false, false, false, false], "Dorsaux"),
  WorkoutTopic("Cardio", "asset",
      [false, false, false, false, false, false, false], "Velo, moto, dodo"),
];

const List<String> weekdays = ["L", "M", "M", "J", "V", "S", "D"];
