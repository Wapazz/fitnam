part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  final ProfileFormData profile;
  const ProfileState(this.profile);

  @override
  List<Object> get props => [profile];
}

class ProfileInitial extends ProfileState {
  const ProfileInitial(super.profile);
}

class ProfileModified extends ProfileState {
  const ProfileModified(super.profile);
}
