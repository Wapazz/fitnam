import 'package:fitnam/bloc/app/app_bloc.dart';
import 'package:fitnam/bloc/current_user/current_user_cubit.dart';
import 'package:fitnam/data/models/fit_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({Key? key, required this.user}) : super(key: key);
  final FitUser user;

  static Route route(user) => MaterialPageRoute(builder: ((context) {
        return StatsPage(user: user);
      }));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(FontAwesomeIcons.chevronLeft),
            onPressed: () => context.read<CurrentUserCubit>().onNavigateBack()),
        title: const Text("Stats"),
        actions: [
          IconButton(
              onPressed: () =>
                  context.read<AppBloc>().add(AppLogoutRequested()),
              icon: const Icon(FontAwesomeIcons.rightToBracket))
        ],
      ),
      body: Container(),
    );
  }
}
