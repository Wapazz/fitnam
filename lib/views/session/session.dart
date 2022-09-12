import 'package:fitnam/bloc/current_user/current_user_cubit.dart';
import 'package:fitnam/bloc/workout/workout_cubit.dart';
import 'package:fitnam/data/models/fit_user.dart';
import 'package:fitnam/views/session/setup_session.dart';
import 'package:fitnam/views/session/workout_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    // TODO ADD WILLPOP SCOPE FOR ALL PAGES
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          print("OULAH FAUT CHANGER LE STATE");
          context.read<CurrentUserCubit>().onNavigateBack();
          return true;
        },
        child:
            BlocBuilder<WorkoutCubit, WorkoutState>(builder: ((context, state) {
          if (state is WorkoutInitial) {
            return SetupSession(program: state.program);
          } else {
            return const WorkoutPage();
          }
        })),
      ),
    );
  }
}
