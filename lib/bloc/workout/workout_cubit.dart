import 'package:equatable/equatable.dart';
import 'package:fitnam/core/date_helper.dart';
import 'package:fitnam/data/models/fit_exercise.dart';
import 'package:fitnam/data/models/last_workout.dart';
import 'package:fitnam/data/models/workout_topic.dart';
import 'package:fitnam/data/repositories/database_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

part 'workout_state.dart';

class WorkoutCubit extends Cubit<WorkoutState> {
  final DatabaseRepository _db = DatabaseRepository();
  WorkoutCubit(List<WorkoutTopic> activated)
      : super(WorkoutInitial(activated, const [], 0, "", ""));

  startWorkout(LastWorkout? lastWorkout, List<FitExercise> allExercises) async {
    List<FitExercise> exercises = [];
    String lastSessionUid = "";
    if (lastWorkout != null && DateHelper.isToday(lastWorkout.date)) {
      exercises = await _db.getLastWorkoutExercises(lastWorkout.sessionUid);
      lastSessionUid = lastWorkout.sessionUid;
    } else {
      Uuid uidGen = const Uuid();
      exercises = allExercises
          .where((element) =>
              state.program.map((e) => e.name).toList().contains(element.topic))
          .toList();
      lastSessionUid = uidGen.v4();
    }
    emit(WorkoutStarted(state.program, exercises, state.selectedIndex,
        state.expandedExercise, lastSessionUid));
  }

  changeProgram(WorkoutTopic topic) {
    List<WorkoutTopic> program = [...state.program];
    int idx = program.indexOf(topic);
    if (idx == -1) {
      // ADD TO PROGRAM
      program.add(topic);
    } else {
      // REMOVE FROM PROGRAM
      program.remove(topic);
    }
    emit(WorkoutInitial(program, state.exercises, state.selectedIndex,
        state.expandedExercise, state.currentSession));
  }

  changeIndex(int idx) {
    emit(WorkoutStarted(state.program, state.exercises, idx,
        state.expandedExercise, state.currentSession));
  }

  changeExercises(List<FitExercise> exercices) {
    emit(WorkoutStarted(state.program, exercices, state.selectedIndex,
        state.expandedExercise, state.currentSession));
  }

  clickExercise(FitExercise exercise) {
    List<FitExercise> tmpList = [...state.exercises];
    FitExercise confirm = tmpList.firstWhere(
        (element) => element.uid == exercise.uid,
        orElse: () => FitExercise.empty);

    if (confirm.isNotEmpty) {
      tmpList.remove(confirm);
    } else {
      tmpList.add(exercise);
    }

    emit(WorkoutStarted(state.program, tmpList, state.selectedIndex,
        state.expandedExercise, state.currentSession));
  }

  editExercise(FitExercise exercise) {
    List<FitExercise> tmpList = [...state.exercises];
    FitExercise confirm = tmpList.firstWhere(
        (element) => element.uid == exercise.uid,
        orElse: () => FitExercise.empty);

    if (confirm.isEmpty) {
      return;
    }
    tmpList.replaceRange(
        tmpList.indexOf(confirm), tmpList.indexOf(confirm) + 1, [exercise]);
    emit(WorkoutStarted(state.program, tmpList, state.selectedIndex,
        state.expandedExercise, state.currentSession));
  }

  expandExercise(FitExercise exercise) {
    emit(WorkoutStarted(state.program, state.exercises, state.selectedIndex,
        exercise.uid, state.currentSession));
  }
}
