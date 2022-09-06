import 'package:equatable/equatable.dart';
import 'package:fitnam/data/models/profile_form_data.dart';
import 'package:fitnam/data/models/workout_topic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(ProfileFormData profileData)
      : super(ProfileInitial(profileData));

  updateTopicSchedule(topic, idx) {
    List<WorkoutTopic> prg = [...state.profile.program];
    List<bool> schedule = [...prg[prg.indexOf(topic)].schedule];
    schedule[idx] = !schedule[idx];
    WorkoutTopic newTopic =
        prg[prg.indexOf(topic)].copyWith(schedule: schedule);
    prg[prg.indexOf(topic)] = newTopic;
    emit(ProfileModified(state.profile.copyWith(program: prg)));
  }

  savingProfile() {
    emit(ProfileSaving(state.profile));
  }
}
