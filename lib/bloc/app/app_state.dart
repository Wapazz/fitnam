part of 'app_bloc.dart';

enum AppStatus {
  home,
  unauthenticated,
  authLoading,
}

class AppState extends Equatable {
  const AppState._({
    required this.status,
    this.user = FitUser.empty,
  });

  const AppState.home(FitUser user)
      : this._(status: AppStatus.home, user: user);

  const AppState.unauthenticated() : this._(status: AppStatus.unauthenticated);
  const AppState.authLoading() : this._(status: AppStatus.unauthenticated);

  final AppStatus status;
  final FitUser user;

  @override
  List<Object> get props => [status, user];
}
