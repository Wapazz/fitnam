part of 'workout_cubit.dart';

abstract class WorkoutState extends Equatable {
  const WorkoutState(this.program, this.exercises);
  final List<WorkoutTopic> program;
  final List<FitExercise> exercises;

  @override
  List<Object> get props => [...program, ...exercises];
}

class WorkoutInitial extends WorkoutState {
  const WorkoutInitial(super.program, super.exercises);
}

class WorkoutStarted extends WorkoutState {
  const WorkoutStarted(super.program, super.exercises);
}

class WorkoutCompleted extends WorkoutState {
  const WorkoutCompleted(super.program, super.exercises);
}
