import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'avatar_state.dart';

class AvatarCubit extends Cubit<AvatarState> {
  AvatarCubit(String avatar) : super(AvatarInitial(avatar));

  selectAvatar(String avatar) => emit(AvatarModified(avatar));
}
