import 'package:fitnam/bloc/profile/profile_cubit.dart';
import 'package:fitnam/data/models/workout_topic.dart';
import 'package:fitnam/data/start/workout_data.dart';
import 'package:fitnam/views/profile/widgets/schedule_dot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopicSchedule extends StatelessWidget {
  const TopicSchedule({Key? key, required this.topic}) : super(key: key);
  final WorkoutTopic topic;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            child:
                Center(child: Image.asset("assets/workout/${topic.name}.png")),
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
        child: ScheduleDot(
          isSelected: topic.schedule[i],
          index: i,
          onTap: () =>
              context.read<ProfileCubit>().updateTopicSchedule(topic, i),
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
