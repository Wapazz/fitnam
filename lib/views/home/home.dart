import 'package:fitnam/bloc/app/app_bloc.dart';
import 'package:fitnam/data/models/fit_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets/fit_fab.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.user}) : super(key: key);
  final FitUser user;

  // static Page page() => const MaterialPage(child: HomePage(user: user,));

  @override
  Widget build(BuildContext context) {
    int todaysIndex = DateTime.now().weekday;
    // bool hasWeighting = user.program.weighting.isNotEmpty &&
    //     user.program.weighting[todaysIndex];
    // bool hasWorkout = user.program.abs.isNotEmpty &&
    //         user.program.abs[todaysIndex] ||
    //     user.program.cardio.isNotEmpty && user.program.cardio[todaysIndex] ||
    //     user.program.upperBody.isNotEmpty &&
    //         user.program.upperBody[todaysIndex] ||
    //     user.program.lowerBody.isNotEmpty &&
    //         user.program.lowerBody[todaysIndex] ||
    //     user.program.back.isNotEmpty && user.program.back[todaysIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
              onPressed: () =>
                  context.read<AppBloc>().add(AppLogoutRequested()),
              icon: Icon(FontAwesomeIcons.rightToBracket))
        ],
      ),
      floatingActionButton: FitFab(),
      body: SingleChildScrollView(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Hello, ${user.name}"),
          Text("Todays motto"),
          Text("${user.program}")
          // if (hasWorkout) WorkoutCard(),
          // if (hasWeighting) WeightingCard(),
        ],
      )),
    );
  }
}
