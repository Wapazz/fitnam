import 'package:equatable/equatable.dart';
import 'package:fitnam/data/models/fit_user.dart';
import 'package:fitnam/data/models/profile_form_data.dart';
import 'package:fitnam/data/repositories/database_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'current_user_state.dart';

class CurrentUserCubit extends Cubit<CurrentUserState> {
  CurrentUserCubit({required this.databaseRepository})
      : super(const CurrentUserInitial(FitUser.empty));

  final DatabaseRepository databaseRepository;

  void getStreamUser(FitUser user) {
    databaseRepository.streamUser(user).listen((users) {
      if (users.avatar.isEmpty) {
        emit(CurrentUserOnboarding(users));
      } else {
        emit(CurrentUserAvailable(users));
      }
    });
  }

  Future<void> completeOnboarding() async {
    await databaseRepository.completeOnboarding(state.user);
  }

  void onNavigateToProfile() => emit(
      CurrentUserAvailable(state.user, navigation: AppNavigation.settings));
  void onNavigateToSession() =>
      emit(CurrentUserAvailable(state.user, navigation: AppNavigation.session));
  void onNavigateToStats() =>
      emit(CurrentUserAvailable(state.user, navigation: AppNavigation.stats));
  void onNavigateToWeighting() => emit(
      CurrentUserAvailable(state.user, navigation: AppNavigation.weighting));
  void onNavigateBack() =>
      emit(CurrentUserAvailable(state.user, navigation: AppNavigation.home));

  Future<void> saveProfile(ProfileFormData data) async {
    await databaseRepository.saveProfile(state.user, data);
    emit(CurrentUserAvailable(state.user, navigation: AppNavigation.home));
  }
}