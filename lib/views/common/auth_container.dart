import 'package:fitnam/bloc/app/app_bloc.dart';
import 'package:fitnam/bloc/current_user/current_user_cubit.dart';
import 'package:fitnam/core/routes.dart';
import 'package:fitnam/views/onboarding/onboarding.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthContainer extends StatelessWidget {
  const AuthContainer({Key? key}) : super(key: key);

  static Page page() => const MaterialPage(child: AuthContainer());

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    context.read<CurrentUserCubit>().getStreamUser(user);
    print("Auth container user: $user");
    return BlocBuilder<CurrentUserCubit, CurrentUserState>(
        builder: (context, state) {
      if (state is CurrentUserLoading || state is CurrentUserInitial) {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      } else if (state is CurrentUserAvailable) {
        return FlowBuilder<AppNavigation>(
          state: state.navigation,
          onGeneratePages: onGenerateNavigationPages,
        );
      } else if (state is CurrentUserOnboarding) {
        return const OnboardingPage();
      }
      return const Scaffold(body: Center(child: Text("fail")));
    });
  }
}
