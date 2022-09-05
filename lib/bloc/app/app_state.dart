part of 'app_bloc.dart';

enum AppStatus { authenticated, unauthenticated, authLoading }

class AppState extends Equatable {
  const AppState._({
    required this.status,
    this.user = FitUser.empty,
  });

  const AppState.authenticated(FitUser user)
      : this._(status: AppStatus.authenticated, user: user);

  const AppState.unauthenticated() : this._(status: AppStatus.unauthenticated);

  const AppState.authLoading() : this._(status: AppStatus.authLoading);

  // const AppState.needsUpdate() : this._(status: AppStatus.needsUpdate);

  final AppStatus status;
  final FitUser user;

  @override
  List<Object> get props => [status, user];
}
