import 'package:equatable/equatable.dart';
import 'package:fitnam/data/models/fit_program.dart';

class OnboardingData extends Equatable {
  final String name;
  final String avatar;
  final FitProgram program;
  const OnboardingData({
    required this.name,
    required this.avatar,
    required this.program,
  });

  @override
  List<Object?> get props => [name, avatar, program];
}
