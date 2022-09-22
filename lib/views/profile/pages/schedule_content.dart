import 'package:fitnam/data/models/workout_topic.dart';
import 'package:flutter/material.dart';

import '../schedule/topic_schedule.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({Key? key, required this.program}) : super(key: key);
  final List<WorkoutTopic> program;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        ...program
            .map((e) => Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: TopicSchedule(topic: e),
                ))
            .toList(),
        const SizedBox(height: 20),
      ]),
    );
  }
}
