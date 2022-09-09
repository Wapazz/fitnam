import 'package:fitnam/bloc/current_user/current_user_cubit.dart';
import 'package:fitnam/bloc/profile/profile_cubit.dart';
import 'package:fitnam/data/models/fit_user.dart';
import 'package:fitnam/data/models/profile_form_data.dart';
import 'package:fitnam/views/common/widget/animated_cta.dart';
import 'package:fitnam/views/common/widget/fit_header.dart';
import 'package:fitnam/views/profile/widgets/topic_schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key, required this.user}) : super(key: key);
  final FitUser user;

  static Route route(FitUser user) => MaterialPageRoute(builder: ((context) {
        return BlocProvider(
          create: (context) => ProfileCubit(ProfileFormData.fromUser(user)),
          child: ProfilePage(user: user),
        );
      }));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: ((context, state) {}),
        builder: (context, state) {
          return Stack(
            children: [
              SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FitHeader(
                          avatar: user.avatar,
                          title: "Hello, ${user.firstName} !",
                          message:
                              "Construis ici ton programme de musculation jour par jour.",
                          hasClosedBottom: true),
                      // WeightSettings(),
                      const Text("Mon programme"),
                      ...state.profile.program
                          .map((e) => TopicSchedule(topic: e))
                          .toList(),
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
                    child: AnimatedCTA(
                      isActive: state is ProfileModified,
                      message: 'Valider le profil',
                      onTap: () => context
                          .read<CurrentUserCubit>()
                          .saveProfile(state.profile),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
