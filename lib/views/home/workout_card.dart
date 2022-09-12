import 'package:fitnam/bloc/current_user/current_user_cubit.dart';
import 'package:fitnam/data/models/workout_topic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard(
      {Key? key, required this.program, required this.todaysIndex})
      : super(key: key);
  final List<WorkoutTopic> program;
  final int todaysIndex;

  generateActivitiesIcons() {
    List<Widget> activites = [];
    for (WorkoutTopic topic in program) {
      if (topic.name != "idWeighting" && topic.schedule[todaysIndex]) {
        activites.add(
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SizedBox(
              width: 60,
              child: Image.asset(
                // RENDRE VARIABLE
                "assets/workout/${topic.name}.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      }
    }
    return activites;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: InkWell(
        onTap: () {
          context.read<CurrentUserCubit>().onNavigateToSession();
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[900],
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(2, 2),
                blurRadius: 10.0,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15.0),
            child: Row(
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [...generateActivitiesIcons()],
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "Seance de sport",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      const Text(
                          "On se donne a fond aujourdhui et on sera content demain !",
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                ),
                Container(
                  width: 20,
                  child: Icon(
                    FontAwesomeIcons.chevronRight,
                    size: 20,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
