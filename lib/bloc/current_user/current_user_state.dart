part of 'current_user_cubit.dart';

enum AppNavigation {
  session,
  weighting,
  stats,
  settings,
  home,
  firstHome,
  avatar,
  backToSettings,
}

abstract class CurrentUserState extends Equatable {
  final FitUser user;
  const CurrentUserState(this.user);

  @override
  List<Object> get props => [user];
}

class CurrentUserInitial extends CurrentUserState {
  const CurrentUserInitial(super.user);
}

class CurrentUserLoading extends CurrentUserState {
  const CurrentUserLoading(super.user);
}

class CurrentUserAvailable extends CurrentUserState {
  final AppNavigation navigation;

  const CurrentUserAvailable(super.user,
      {this.navigation = AppNavigation.firstHome});

  @override
  List<Object> get props => [navigation, user];

  CurrentUserAvailable copyWith({
    AppNavigation? navigation,
  }) {
    return CurrentUserAvailable(
      super.user,
      navigation: navigation ?? this.navigation,
    );
  }
}

class CurrentUserOnboarding extends CurrentUserState {
  const CurrentUserOnboarding(super.user);
}

class CurrentUserError extends CurrentUserState {
  const CurrentUserError(super.user);
}
