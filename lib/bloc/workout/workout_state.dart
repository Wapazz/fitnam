part of 'workout_cubit.dart';

abstract class WorkoutState extends Equatable {
  const WorkoutState(this.program, this.exercises, this.selectedIndex,
      this.expandedExercise, this.currentSession);
  final List<WorkoutTopic> program;
  final List<FitExercise> exercises;
  final int selectedIndex;
  final String expandedExercise;
  final String currentSession;

  @override
  List<Object> get props =>
      [...program, ...exercises, selectedIndex, expandedExercise];
}

class WorkoutInitial extends WorkoutState {
  const WorkoutInitial(super.program, super.exercises, super.selectedIndex,
      super.expandedExercise, super.currentSession);
}

class WorkoutStarted extends WorkoutState {
  const WorkoutStarted(super.program, super.exercises, super.selectedIndex,
      super.expandedExercise, super.currentSession);

  WorkoutStarted copyWith({
    List<WorkoutTopic>? program,
    List<FitExercise>? exercises,
    int? selectedIndex,
    String? expandedExercise,
    String? currentSession,
  }) {
    return WorkoutStarted(
        program ?? super.program,
        exercises ?? super.exercises,
        selectedIndex ?? super.selectedIndex,
        expandedExercise ?? super.expandedExercise,
        currentSession ?? super.currentSession);
  }
}

class WorkoutCompleted extends WorkoutState {
  const WorkoutCompleted(super.program, super.exercises, super.selectedIndex,
      super.expandedExercise, super.currentSession);
}
