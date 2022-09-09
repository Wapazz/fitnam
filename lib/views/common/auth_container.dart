import 'package:fitnam/bloc/app/app_bloc.dart';
import 'package:fitnam/bloc/current_user/current_user_cubit.dart';
import 'package:fitnam/core/routes.dart';
import 'package:fitnam/views/home/home.dart';
import 'package:fitnam/views/onboarding/onboarding.dart';
import 'package:fitnam/views/profile/profile.dart';
import 'package:fitnam/views/session/session.dart';
import 'package:fitnam/views/stats/stats.dart';
import 'package:fitnam/views/weighting/weighting.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthContainer extends StatelessWidget {
  const AuthContainer({Key? key}) : super(key: key);

  static Page page() => const MaterialPage(child: AuthContainer());

  @override
  Widget build(BuildContext context) {
    final baseUser = context.select((AppBloc bloc) => bloc.state.user);
    context.read<CurrentUserCubit>().getStreamUser(baseUser);

    return BlocConsumer<CurrentUserCubit, CurrentUserState>(
        listener: (context, state) {
      if (state is CurrentUserAvailable) {
        if (state.navigation == AppNavigation.session) {
          Navigator.push(context, SessionPage.route(state.user));
        } else if (state.navigation == AppNavigation.settings) {
          Navigator.push(context, ProfilePage.route(state.user));
        } else if (state.navigation == AppNavigation.stats) {
          Navigator.push(context, StatsPage.route(state.user));
        } else if (state.navigation == AppNavigation.weighting) {
          Navigator.push(context, WeightingPage.route(state.user));
        }
        if (state.navigation == AppNavigation.home) {
          Navigator.pop(context);
        }
      }
    }, builder: (context, state) {
      if (state is CurrentUserLoading || state is CurrentUserInitial) {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      } else if (state is CurrentUserAvailable) {
        return HomePage(user: state.user);
      } else if (state is CurrentUserOnboarding) {
        return const OnboardingPage();
      }
      return const Scaffold(body: Center(child: Text("fail")));
    });
  }
}
