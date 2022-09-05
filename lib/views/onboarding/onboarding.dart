import 'package:fitnam/bloc/app/app_bloc.dart';
import 'package:fitnam/bloc/current_user/current_user_cubit.dart';
import 'package:fitnam/data/models/fit_program.dart';
import 'package:fitnam/data/models/fit_user.dart';
import 'package:fitnam/data/models/onboarding_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage(child: OnboardingPage());

  @override
  Widget build(BuildContext context) {
    FitUser user =
        (context.read<CurrentUserCubit>().state as CurrentUserOnboarding)
            .fitUser;

    return Scaffold(
      appBar: AppBar(
        title: Text("Onboarding"),
        actions: [
          IconButton(
              onPressed: () =>
                  context.read<AppBloc>().add(AppLogoutRequested()),
              icon: Icon(FontAwesomeIcons.rightToBracket))
        ],
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Complete onboarding"),
          onPressed: (() => context.read<CurrentUserCubit>().completeOnboarding(
              OnboardingData(
                  avatar: "default.png",
                  program: FitProgram.empty,
                  name: user.name),
              user)),
        ),
      ),
    );
  }
}
