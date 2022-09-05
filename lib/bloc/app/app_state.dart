part of 'app_bloc.dart';

enum AppStatus {
  home,
  unauthenticated,
  authLoading,
  // workout,
  // weighting,
  // profile,
  // stats
}

class AppState extends Equatable {
  const AppState._({
    required this.status,
    this.user = FitUser.empty,
  });

  const AppState.home(FitUser user)
      : this._(status: AppStatus.home, user: user);
  // const AppState.workout(FitUser user)
  //     : this._(status: AppStatus.workout, user: user);
  // const AppState.weighting(FitUser user)
  //     : this._(status: AppStatus.weighting, user: user);
  // const AppState.profile(FitUser user)
  //     : this._(status: AppStatus.profile, user: user);
  // const AppState.stats(FitUser user)
  //     : this._(status: AppStatus.stats, user: user);

  const AppState.unauthenticated() : this._(status: AppStatus.unauthenticated);
  const AppState.authLoading() : this._(status: AppStatus.unauthenticated);

  // const AppState.needsUpdate() : this._(status: AppStatus.needsUpdate);

  final AppStatus status;
  final FitUser user;

  @override
  List<Object> get props => [status, user];
}
