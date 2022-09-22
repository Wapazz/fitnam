part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  final ProfileFormData profile;
  final int selectedIndex;
  const ProfileState(this.profile, this.selectedIndex);

  @override
  List<Object> get props => [profile, selectedIndex];
}

class ProfileInitial extends ProfileState {
  const ProfileInitial(super.profile, super.selectedIndex);
}

class ProfileModified extends ProfileState {
  const ProfileModified(super.profile, super.selectedIndex);
}
