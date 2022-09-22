import 'package:fitnam/bloc/workout/workout_cubit.dart';
import 'package:fitnam/data/models/fit_user.dart';
import 'package:fitnam/views/common/widget/secured_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'setup_session.dart';
import 'workout_page.dart';

class SessionPage extends StatelessWidget {
  const SessionPage({Key? key, required this.user}) : super(key: key);
  final FitUser user;

  static Route route(FitUser user) => MaterialPageRoute(builder: ((context) {
        return BlocProvider(
          create: (context) => WorkoutCubit(user.program
              .where((e) => e.schedule[DateTime.now().weekday - 1])
              .toList()),
          child: SessionPage(user: user),
        );
      }));

  @override
  Widget build(BuildContext context) {
    return SecuredScaffold(
      body: BlocBuilder<WorkoutCubit, WorkoutState>(
        builder: ((context, state) {
          if (state is WorkoutInitial) {
            return SetupSession(program: state.program);
          } else {
            return WorkoutPage(
              user: user,
              program:
                  state.program.where((e) => e.name != "idWeighting").toList(),
              exercices: state.exercises,
              selectedIndex: state.selectedIndex,
            );
          }
        }),
      ),
    );
  }
}
