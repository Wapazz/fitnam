import 'package:fitnam/bloc/app/app_bloc.dart';
import 'package:fitnam/bloc/current_user/current_user_cubit.dart';
import 'package:fitnam/data/models/fit_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FitFab extends StatelessWidget {
  const FitFab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: FontAwesomeIcons.a,
      activeIcon: FontAwesomeIcons.accessibleIcon,
      overlayColor: Colors.black,
      overlayOpacity: 0.7,
      children: [
        SpeedDialChild(
          child: const Icon(FontAwesomeIcons.handFist),
          backgroundColor: Colors.black,
          foregroundColor: Colors.yellow,
          labelShadow: [],
          labelStyle: const TextStyle(color: Colors.white),
          labelBackgroundColor: Colors.transparent,
          label: 'Seance',
          onTap: () => context.read<CurrentUserCubit>().onNavigateToSession(),
        ),
        SpeedDialChild(
          child: const Icon(FontAwesomeIcons.weightScale),
          backgroundColor: Colors.black,
          foregroundColor: Colors.yellow,
          labelShadow: [],
          labelStyle: const TextStyle(color: Colors.white),
          labelBackgroundColor: Colors.transparent,
          label: 'Pesee',
          onTap: () => context.read<CurrentUserCubit>().onNavigateToWeighting(),
        ),
        SpeedDialChild(
          child: const Icon(FontAwesomeIcons.chartSimple),
          backgroundColor: Colors.black,
          foregroundColor: Colors.yellow,
          labelShadow: [],
          labelStyle: const TextStyle(color: Colors.white),
          labelBackgroundColor: Colors.transparent,
          label: 'Stats',
          onTap: () => context.read<CurrentUserCubit>().onNavigateToStats(),
        ),
        SpeedDialChild(
          child: const Icon(FontAwesomeIcons.gear),
          backgroundColor: Colors.black,
          foregroundColor: Colors.yellow,
          label: 'Settings',
          labelShadow: [],
          labelStyle: const TextStyle(color: Colors.white),
          labelBackgroundColor: Colors.transparent,
          onTap: () => context.read<CurrentUserCubit>().onNavigateToProfile(),
        ),
        SpeedDialChild(
          child: const Icon(FontAwesomeIcons.leaf),
          backgroundColor: Colors.black,
          foregroundColor: Colors.yellow,
          labelShadow: [],
          labelStyle: const TextStyle(color: Colors.white),
          labelBackgroundColor: Colors.transparent,
          label: 'Logout',
          onTap: () => context.read<AppBloc>().add(AppLogoutRequested()),
        ),
      ],
    );
  }
}
