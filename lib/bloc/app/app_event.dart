part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppLogoutRequested extends AppEvent {}

class AppLoadRemoteConfig extends AppEvent {}

class AppUserGoogleLogin extends AppEvent {}

class AppUserChanged extends AppEvent {
  @visibleForTesting
  const AppUserChanged(this.user);

  final FitUser user;

  @override
  List<Object> get props => [user];
}

class AppNavigationToProfile extends AppEvent {
  @visibleForTesting
  const AppNavigationToProfile(this.user);

  final FitUser user;

  @override
  List<Object> get props => [user];
}

class AppNavigationToWeight extends AppEvent {
  @visibleForTesting
  const AppNavigationToWeight(this.user);

  final FitUser user;

  @override
  List<Object> get props => [user];
}

class AppNavigationToStats extends AppEvent {
  @visibleForTesting
  const AppNavigationToStats(this.user);

  final FitUser user;

  @override
  List<Object> get props => [user];
}

class AppNavigationToWorkout extends AppEvent {
  @visibleForTesting
  const AppNavigationToWorkout(this.user);

  final FitUser user;

  @override
  List<Object> get props => [user];
}
