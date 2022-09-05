part of 'fab_menu_cubit.dart';

class FabMenuState extends Equatable {
  final bool isOpen;
  const FabMenuState({this.isOpen = false});

  @override
  List<Object> get props => [];
}

class FabMenuClose extends FabMenuState {
  const FabMenuClose() : super(isOpen: false);
}

class FabMenuOpen extends FabMenuState {
  const FabMenuOpen() : super(isOpen: true);
}
