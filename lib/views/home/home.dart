import 'package:fitnam/bloc/app/app_bloc.dart';
import 'package:fitnam/data/models/fit_user.dart';
import 'package:fitnam/views/common/widget/fit_header.dart';
import 'package:fitnam/views/home/motto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'weighting_card.dart';
import 'widgets/fit_fab.dart';
import 'workout_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.user}) : super(key: key);
  final FitUser user;

  // static Page page() => const MaterialPage(child: HomePage(user: user,));

  @override
  Widget build(BuildContext context) {
    int todaysIndex = DateTime.now().weekday;
    bool hasProgram = user.program.isNotEmpty;
    bool hasWeighting = hasProgram &&
        user.program
            .any((e) => e.name == "idWeighting" && e.schedule[todaysIndex - 1]);
    bool hasWorkout = user.program
        .any((e) => e.name != "idWeighting" && e.schedule[todaysIndex - 1]);

    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Home"),
      //   actions: [
      //     IconButton(
      //         onPressed: () =>
      //             context.read<AppBloc>().add(AppLogoutRequested()),
      //         icon: Icon(FontAwesomeIcons.rightToBracket))
      //   ],
      // ),
      floatingActionButton: const FitFab(),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/home_bg.png",
                fit: BoxFit.cover,
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FitHeader(
                    avatar: user.avatar,
                    title: "Hello, ${user.firstName} !",
                    message:
                        "Découvre ici le programme de ta journée et n'oublie pas :",
                    hasClosedBottom: false,
                  ),
                  const SizedBox(height: 20),
                  const FitMotto(),
                  const SizedBox(height: 50),
                  Text("${DateTime.now()}",
                      style: const TextStyle(color: Colors.white)),
                  const SizedBox(height: 20),
                  if (hasWeighting) WeightingCard(),
                  const SizedBox(height: 12),
                  if (hasWorkout)
                    WorkoutCard(
                        program: user.program, todaysIndex: todaysIndex - 1),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
