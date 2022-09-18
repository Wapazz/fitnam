import 'package:fitnam/core/date_helper.dart';
import 'package:fitnam/data/models/fit_user.dart';
import 'package:fitnam/views/common/widget/fit_header.dart';
import 'package:fitnam/views/home/motto.dart';
import 'package:fitnam/views/home/workout_done_card.dart';
import 'package:flutter/material.dart';

import 'weighting_card.dart';
import 'widgets/fit_fab.dart';
import 'workout_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.user}) : super(key: key);
  final FitUser user;

  @override
  Widget build(BuildContext context) {
    int todaysIndex = DateTime.now().weekday;
    bool hasProgram = user.program.isNotEmpty;
    bool hasDoneWeighting = user.lastWeighting != null &&
        DateHelper.isToday(user.lastWeighting!.date);
    bool hasWeighting = !hasDoneWeighting &&
        hasProgram &&
        user.program
            .any((e) => e.name == "idWeighting" && e.schedule[todaysIndex - 1]);
    bool hasDoneWorkout =
        user.lastWorkout != null && DateHelper.isToday(user.lastWorkout!.date);
    bool hasWorkout = !hasDoneWorkout &&
        hasProgram &&
        user.program
            .any((e) => e.name != "idWeighting" && e.schedule[todaysIndex - 1]);

    return Scaffold(
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
                  const SizedBox(height: 30),
                  // Text("${DateTime.now()}",
                  //     style: const TextStyle(color: Colors.white)),
                  const SizedBox(height: 20),
                  // TODO ADD FIRST PROFILE SETUP & FIRST PESEE
                  if (hasWeighting) const WeightingCard(),
                  const SizedBox(height: 12),
                  if (hasWorkout)
                    WorkoutCard(
                        program: user.program, todaysIndex: todaysIndex - 1),
                  if (hasDoneWorkout) const WorkoutCompletedCard(),
                  // if (hasDoneWeighting)
                  //   Container(
                  //     child: Text("GG POUR LE PESEE"),
                  //   ),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
