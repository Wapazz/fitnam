import 'package:fitnam/bloc/current_user/current_user_cubit.dart';
import 'package:fitnam/bloc/profile/profile_cubit.dart';
import 'package:fitnam/data/models/fit_user.dart';
import 'package:fitnam/data/models/profile_form_data.dart';
import 'package:fitnam/views/common/widget/animated_cta.dart';
import 'package:fitnam/views/common/widget/fit_header.dart';
import 'package:fitnam/views/common/widget/secured_scaffold.dart';
import 'package:fitnam/views/profile/widgets/metrics_switch.dart';
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
    return SecuredScaffold(
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: ((context, state) {}),
        builder: (context, state) {
          return Stack(
            children: [
              SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocBuilder<CurrentUserCubit, CurrentUserState>(
                        builder: (context, userState) {
                          return FitHeader(
                            avatar: userState.user.avatar,
                            title: "Profil & programme",
                            message:
                                "Construis ici ton programme de musculation jour par jour.",
                            hasClosedBottom: true,
                            isEditable: true,
                            nbSession: user.nbWorkout,
                          );
                        },
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            const Text("Unité de poids",
                                style: TextStyle(color: Colors.grey)),
                            const Spacer(),
                            MetricsSwitch(
                                onTap: (value) => context
                                    .read<ProfileCubit>()
                                    .updateMetricSettings(value),
                                state: state.profile.usesEuropeanMetrics),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text("Mon programme",
                            style: TextStyle(color: Colors.grey)),
                      ),
                      ...state.profile.program
                          .map((e) => Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: TopicSchedule(topic: e),
                              ))
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
                      message: 'Sauvegarder',
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
