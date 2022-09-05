import 'package:equatable/equatable.dart';
import 'package:fitnam/data/models/fit_user.dart';
import 'package:fitnam/data/repositories/authentication_repository.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(
          authenticationRepository.currentUser.isNotEmpty
              ? AppState.home(authenticationRepository.currentUser)
              : const AppState.unauthenticated(),
        ) {
    on<AppUserChanged>(_onUserChanged);
    on<AppLogoutRequested>(_onLogoutRequested);
    on<AppUserGoogleLogin>(_onUserGoogleLogin);

    // on<AppNavigationToProfile>(_onNavigateToProfile);
    // on<AppNavigationToWeight>(_onNavigateToWeights);
    // on<AppNavigationToWorkout>(_onNavigateToWorkout);
    // on<AppNavigationToStats>(_onNavigateToStats);

    _userSubscription = _authenticationRepository.user.listen(
      (user) => add(AppUserChanged(user)),
    );
  }

  final AuthenticationRepository _authenticationRepository;

  late final StreamSubscription<FitUser> _userSubscription;

  void _onUserChanged(AppUserChanged event, Emitter<AppState> emit) {
    emit(
      event.user.isNotEmpty
          ? AppState.home(event.user)
          : const AppState.unauthenticated(),
    );
  }

  // void _onNavigateToProfile(
  //         AppNavigationToProfile event, Emitter<AppState> emit) =>
  //     emit(AppState.profile(event.user));
  // void _onNavigateToStats(AppNavigationToStats event, Emitter<AppState> emit) =>
  //     emit(AppState.stats(event.user));
  // void _onNavigateToWorkout(
  //         AppNavigationToWorkout event, Emitter<AppState> emit) =>
  //     emit(AppState.workout(event.user));
  // void _onNavigateToWeights(
  //         AppNavigationToWeight event, Emitter<AppState> emit) =>
  //     emit(AppState.weighting(event.user));

  void _onLogoutRequested(AppLogoutRequested event, Emitter<AppState> emit) {
    unawaited(_authenticationRepository.logOut());
  }

  void _onUserGoogleLogin(
      AppUserGoogleLogin event, Emitter<AppState> emit) async {
    emit(const AppState.authLoading());
    try {
      await _authenticationRepository.logInWithGoogle();
    } catch (_) {
      emit(const AppState.unauthenticated());
    }
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
