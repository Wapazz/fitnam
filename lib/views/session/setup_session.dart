import 'package:fitnam/bloc/current_user/current_user_cubit.dart';
import 'package:fitnam/bloc/workout/workout_cubit.dart';
import 'package:fitnam/data/models/workout_topic.dart';
import 'package:fitnam/data/start/workout_data.dart';
import 'package:fitnam/views/session/widgets/topic_activation_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_to_act/slide_to_act.dart';

class SetupSession extends StatelessWidget {
  const SetupSession({Key? key, required this.program}) : super(key: key);
  final List<WorkoutTopic> program;

  @override
  Widget build(BuildContext context) {
    List<WorkoutTopic> displayedProgram = [...program]
      ..sort(((a, b) => a.schedule[DateTime.now().weekday - 1] ? 0 : 1));

    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            "assets/session_bg.png",
            fit: BoxFit.cover,
          ),
        ),
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "ton programme de la journée".toUpperCase(),
                          style: GoogleFonts.arsenal(
                              fontSize: 26,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      IconButton(
                          onPressed: () =>
                              context.read<CurrentUserCubit>().onNavigateBack(),
                          icon: const Icon(FontAwesomeIcons.xmark))
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Cette session est basée sur ton programme initial. Tu peux néanmoins  ajouter ou enlever des exercices à ta session du jour.",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                const SizedBox(height: 30),
                // LIST DE TOPICS
                ...program
                    .where((e) => e.name != "idWeighting")
                    .map((e) => TopicActivationCard(
                          topic: e,
                          isActive: true,
                        ))
                    .toList(),
                ...programData
                    .where((e) =>
                        e.name != "idWeighting" &&
                        program.where((cmp) => cmp.name == e.name).isEmpty)
                    .map((e) => TopicActivationCard(topic: e, isActive: false)),
                const SizedBox(height: 90),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 80,
            color: Theme.of(context).scaffoldBackgroundColor,
            child: GestureDetector(
              child: Container(
                  alignment: const Alignment(0, 0.9),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: SizedBox(
                      height: 100,
                      child: Builder(
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: SlideAction(
                              borderRadius: 0,
                              onSubmit: () {
                                context.read<WorkoutCubit>().startWorkout();
                              },
                              innerColor: Theme.of(context).primaryColor,
                              outerColor: Colors.grey[800],
                              text: "  Demarrer maintenant",
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).primaryColor),
                            ),
                          );
                        },
                      ),
                    ),
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
