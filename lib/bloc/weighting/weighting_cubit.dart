import 'package:equatable/equatable.dart';
import 'package:fitnam/data/models/fit_weighting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'weighting_state.dart';

class WeightingCubit extends Cubit<WeightingState> {
  WeightingCubit(FitWeighting weightsData)
      : super(WeightingInitial(weightsData));

  // updateTopicSchedule(topic, idx) {
  //   List<WorkoutTopic> prg = [...state.profile.program];
  //   List<bool> schedule = [...prg[prg.indexOf(topic)].schedule];
  //   schedule[idx] = !schedule[idx];
  //   WorkoutTopic newTopic =
  //       prg[prg.indexOf(topic)].copyWith(schedule: schedule);
  //   prg[prg.indexOf(topic)] = newTopic;
  //   emit(ProfileModified(state.profile.copyWith(program: prg)));
  // }

  updateFatMass(double value) {
    emit(WeightingModified(state.weightData.copyWith(fatMass: value)));
  }

  updateMuscularMass(double value) {
    emit(WeightingModified(state.weightData.copyWith(muscularMass: value)));
  }

  updateWeight(double value) {
    emit(WeightingModified(state.weightData.copyWith(weight: value)));
  }

  // savingWeightingData() {
  //   // emit(ProfileSaving(state.profile));
  // }
}
