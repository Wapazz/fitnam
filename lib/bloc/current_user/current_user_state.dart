part of 'current_user_cubit.dart';

enum AppNavigation { session, weighting, stats, settings, home }

abstract class CurrentUserState extends Equatable {
  const CurrentUserState();

  @override
  List<Object> get props => [];
}

class CurrentUserInitial extends CurrentUserState {}

class CurrentUserLoading extends CurrentUserState {}

class CurrentUserAvailable extends CurrentUserState {
  final FitUser fitUser;
  final AppNavigation navigation;

  const CurrentUserAvailable(
      {required this.fitUser, this.navigation = AppNavigation.home});

  @override
  List<Object> get props => [fitUser, navigation];

  CurrentUserAvailable copyWith({
    FitUser? fitUser,
    AppNavigation? navigation,
  }) {
    return CurrentUserAvailable(
      fitUser: fitUser ?? this.fitUser,
      navigation: navigation ?? this.navigation,
    );
  }
}

class CurrentUserOnboarding extends CurrentUserState {
  final FitUser fitUser;

  const CurrentUserOnboarding({required this.fitUser});

  @override
  List<Object> get props => [fitUser];
}

class CurrentUserError extends CurrentUserState {}
