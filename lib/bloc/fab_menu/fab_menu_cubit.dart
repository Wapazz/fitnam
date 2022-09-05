import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fab_menu_state.dart';

class FabMenuCubit extends Cubit<FabMenuState> {
  FabMenuCubit() : super(const FabMenuClose());

  void clickFab(bool opens) {
    emit(opens ? const FabMenuOpen() : const FabMenuClose());
  }
}
