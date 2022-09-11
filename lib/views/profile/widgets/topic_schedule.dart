import 'package:fitnam/bloc/profile/profile_cubit.dart';
import 'package:fitnam/data/models/workout_topic.dart';
import 'package:fitnam/data/start/workout_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TopicSchedule extends StatelessWidget {
  const TopicSchedule({Key? key, required this.topic}) : super(key: key);
  final WorkoutTopic topic;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: Row(
        children: [
          const CircleAvatar(
            child:
                Center(child: Icon(FontAwesomeIcons.placeOfWorship, size: 30)),
          ),
          const SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(workoutNameFromId(topic.name),
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              Text(workoutDescFromId(topic.name),
                  style: const TextStyle(fontSize: 10, color: Colors.grey)),
              const SizedBox(height: 10),
              ScheduleWidget(topic: topic),
            ],
          ),
        ],
      ),
    );
  }
}

class ScheduleWidget extends StatelessWidget {
  const ScheduleWidget({Key? key, required this.topic}) : super(key: key);
  final WorkoutTopic topic;

  _generateScheduleList(BuildContext context) {
    List<Widget> res = [];

    for (int i = 0; i < topic.schedule.length; i++) {
      res.add(Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: GestureDetector(
          onTap: () =>
              context.read<ProfileCubit>().updateTopicSchedule(topic, i),
          child: Container(
            height: 30,
            width: 30,
            color: topic.schedule[i]
                ? Theme.of(context).primaryColor
                : Colors.grey,
            child: Center(child: Text(weekdays[i])),
          ),
        ),
      ));
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisSize: MainAxisSize.min,
      children: [..._generateScheduleList(context)],
    );
  }
}
