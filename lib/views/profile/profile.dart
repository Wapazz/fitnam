import 'package:fitnam/bloc/app/app_bloc.dart';
import 'package:fitnam/bloc/current_user/current_user_cubit.dart';
import 'package:fitnam/bloc/profile/profile_cubit.dart';
import 'package:fitnam/data/models/fit_user.dart';
import 'package:fitnam/data/models/profile_form_data.dart';
import 'package:fitnam/views/profile/widgets/topic_schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      backgroundColor: Color(0x141313),
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(FontAwesomeIcons.chevronLeft),
            onPressed: () => context.read<CurrentUserCubit>().onNavigateBack()),
        title: Text("Profile"),
        actions: [
          IconButton(
              onPressed: () =>
                  context.read<AppBloc>().add(AppLogoutRequested()),
              icon: Icon(FontAwesomeIcons.rightToBracket))
        ],
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 80,
                      child: Text("header"),
                      color: Colors.blue,
                    ),
                    //ProfileHeader(),
                    // WeightSettings(),
                    Text("Mon programme"),
                    ...state.profile.program
                        .map((e) => TopicSchedule(topic: e))
                        .toList(),
                    SizedBox(
                      height: 90,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15),
                    child: GestureDetector(
                      onTap: (() {
                        context.read<ProfileCubit>().savingProfile();
                        context
                            .read<CurrentUserCubit>()
                            .saveProfile(state.profile);
                      }),
                      child: Container(
                        color: state is ProfileModified
                            ? Colors.yellow
                            : state is ProfileInitial
                                ? Colors.grey
                                : Colors.green,
                        child: Center(
                          child: state is ProfileSaving
                              ? CircularProgressIndicator()
                              : Text("Valider le profil"),
                        ),
                      ),
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
