part of 'workout_cubit.dart';

abstract class WorkoutState extends Equatable {
  const WorkoutState(this.program, this.exercises, this.selectedIndex);
  final List<WorkoutTopic> program;
  final List<FitExercise> exercises;
  final int selectedIndex;

  @override
  List<Object> get props => [...program, ...exercises, selectedIndex];
}

class WorkoutInitial extends WorkoutState {
  const WorkoutInitial(super.program, super.exercises, super.selectedIndex);
}

class WorkoutStarted extends WorkoutState {
  const WorkoutStarted(super.program, super.exercises, super.selectedIndex);
}

class WorkoutCompleted extends WorkoutState {
  const WorkoutCompleted(super.program, super.exercises, super.selectedIndex);
}
