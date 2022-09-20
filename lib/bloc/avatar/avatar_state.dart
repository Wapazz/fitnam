part of 'avatar_cubit.dart';

abstract class AvatarState extends Equatable {
  const AvatarState(this.avatar);
  final String avatar;

  @override
  List<Object> get props => [avatar];
}

class AvatarInitial extends AvatarState {
  const AvatarInitial(super.avatar);
}

class AvatarModified extends AvatarState {
  const AvatarModified(super.avatar);
}
