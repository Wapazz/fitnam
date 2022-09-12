import 'package:equatable/equatable.dart';
import 'package:fitnam/data/models/fit_machine.dart';
import 'package:fitnam/data/models/workout_topic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'workout_state.dart';

class WorkoutCubit extends Cubit<WorkoutState> {
  WorkoutCubit(List<WorkoutTopic> activated)
      : super(WorkoutInitial(activated, const []));

  startWorkout() {
    emit(WorkoutStarted(state.program, state.exercises));
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
    emit(WorkoutInitial(program, state.exercises));
  }
}
