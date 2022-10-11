import 'package:fitnam/bloc/current_user/current_user_cubit.dart';
import 'package:fitnam/bloc/profile/profile_cubit.dart';
import 'package:fitnam/data/models/fit_user.dart';
import 'package:fitnam/data/models/profile_form_data.dart';
import 'package:fitnam/views/common/widget/animated_cta.dart';
import 'package:fitnam/views/common/widget/fit_header.dart';
import 'package:fitnam/views/common/widget/secured_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'settings_page.dart';
import 'widgets/settings_menu.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key, required this.user}) : super(key: key);
  final FitUser user;

  static Route route(FitUser user) => MaterialPageRoute(builder: ((context) {
        return BlocProvider(
          create: (context) =>
              ProfileCubit(ProfileFormData.fromUser(user), user.exercises),
          child: ProfilePage(user: user),
        );
      }));

  @override
  Widget build(BuildContext context) {
    EdgeInsets notchSize = MediaQuery.of(context).padding;
    bool isKeyboardOpen = !FocusScope.of(context).hasPrimaryFocus;
    notchSize = !isKeyboardOpen
        ? notchSize
        : notchSize.copyWith(
            bottom:
                notchSize.bottom + MediaQuery.of(context).viewInsets.bottom);

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: SecuredScaffold(
        body: BlocConsumer<ProfileCubit, ProfileState>(
          listener: ((context, state) {}),
          builder: (context, state) {
            return SizedBox(
              child: Stack(
                children: [
                  SafeArea(
                    child: BlocBuilder<CurrentUserCubit, CurrentUserState>(
                      builder: (context, userState) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FitHeader(
                              avatar: userState.user.avatar,
                              title: "Profil & programme",
                              message:
                                  "Construis ici ton programme de musculation jour par jour.",
                              hasClosedBottom: true,
                              isEditable: true,
                              nbSession: user.nbWorkout,
                            ),
                            const SizedBox(height: 28),
                            SettingsMenu(selectedIndex: state.selectedIndex),
                            SettingsPage(
                                padding: notchSize,
                                profile: state,
                                exercises: userState.user.exercises),
                          ],
                        );
                      },
                    ),
                  ),
                  if (state.selectedIndex == 0 || state.selectedIndex == 7)
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
              ),
            );
          },
        ),
      ),
    );
  }
}
