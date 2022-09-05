import 'package:equatable/equatable.dart';
import 'package:fitnam/data/models/fit_user.dart';
import 'package:fitnam/data/models/onboarding_data.dart';
import 'package:fitnam/data/repositories/database_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'current_user_state.dart';

class CurrentUserCubit extends Cubit<CurrentUserState> {
  CurrentUserCubit({required this.databaseRepository})
      : super(CurrentUserInitial());

  final DatabaseRepository databaseRepository;

  void getStreamUser(FitUser user) {
    // TODO LOOK IF THE EXCEPTION FIREBASE COMES FROM HERE NEED TO UNSUBSCriBE thE STREAM
    databaseRepository.streamUser(user).listen((users) {
      if (users.avatar.isEmpty) {
        emit(CurrentUserOnboarding(fitUser: users));
      } else {
        emit(CurrentUserAvailable(fitUser: users));
      }
    });
  }

  Future<void> completeOnboarding(OnboardingData data, FitUser user) async {
    await databaseRepository.completeOnboarding(data, user);
  }

  void onNavigateToProfile(FitUser user) => emit(
      CurrentUserAvailable(fitUser: user, navigation: AppNavigation.settings));
  void onNavigateToSession(FitUser user) => emit(
      CurrentUserAvailable(fitUser: user, navigation: AppNavigation.session));
  void onNavigateToStats(FitUser user) => emit(
      CurrentUserAvailable(fitUser: user, navigation: AppNavigation.stats));
  void onNavigateToWeighting(FitUser user) => emit(
      CurrentUserAvailable(fitUser: user, navigation: AppNavigation.weighting));
}
