import 'package:fitnam/data/models/workout_topic.dart';

const List<WorkoutTopic> programData = [
  WorkoutTopic(
      "idWorkoutArms", [false, false, false, false, false, false, false]),
  WorkoutTopic(
      "idWorkoutChest", [false, false, false, false, false, false, false]),
  WorkoutTopic(
      "idWorkoutLegs", [false, false, false, false, false, false, false]),
  WorkoutTopic(
      "idWorkoutAbs", [false, false, false, false, false, false, false]),
  WorkoutTopic(
      "idWorkoutBack", [false, false, false, false, false, false, false]),
  WorkoutTopic(
      "idWorkoutCardio", [false, false, false, false, false, false, false]),
  WorkoutTopic(
      "idWeighting", [false, false, false, false, false, false, false]),
];

const List<String> weekdays = ["L", "M", "M", "J", "V", "S", "D"];

String workoutNameFromId(String id) {
  switch (id) {
    case "idWorkoutArms":
      return "Bras & épaules";
    case "idWorkoutChest":
      return "Pectoraux";
    case "idWorkoutAbs":
      return "Abdos";
    case "idWorkoutLegs":
      return "Jambes";
    case "idWorkoutCardio":
      return "Cardio";
    case "idWorkoutBack":
      return "Dos";
    case "idWeighting":
      return "Pesee";
    default:
      return "";
  }
}

String workoutDescFromId(String id) {
  switch (id) {
    case "idWorkoutArms":
      return "Biceps, triceps, quadriceps, épaules";
    case "idWorkoutChest":
      return "Pectoraux";
    case "idWorkoutAbs":
      return "Abdominaux, Crunch";
    case "idWorkoutLegs":
      return "Ischios, mollets";
    case "idWorkoutCardio":
      return "Velo, moto, dodo";
    case "idWorkoutBack":
      return "Dorsaux";
    case "idWeighting":
      return "releve hebdo du poids";
    default:
      return "";
  }
}
