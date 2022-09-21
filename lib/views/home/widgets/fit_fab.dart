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
      icon: FontAwesomeIcons.plus,
      activeIcon: FontAwesomeIcons.xmark,
      overlayColor: Colors.black,
      overlayOpacity: 0.8,
      spaceBetweenChildren: 8,
      children: [
        SpeedDialChild(
          child: const Icon(FontAwesomeIcons.plus),
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.black,
          labelShadow: [],
          labelStyle: const TextStyle(color: Colors.white),
          labelBackgroundColor: Colors.transparent,
          label: 'Séance',
          onTap: () => context.read<CurrentUserCubit>().onNavigateToSession(),
        ),
        SpeedDialChild(
          child: const Icon(FontAwesomeIcons.weightScale),
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.black,
          labelShadow: [],
          labelStyle: const TextStyle(color: Colors.white),
          labelBackgroundColor: Colors.transparent,
          label: 'Pesée',
          onTap: () => context.read<CurrentUserCubit>().onNavigateToWeighting(),
        ),
        SpeedDialChild(
          child: const Icon(FontAwesomeIcons.chartSimple),
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.black,
          labelShadow: [],
          labelStyle: const TextStyle(color: Colors.white),
          labelBackgroundColor: Colors.transparent,
          label: 'Stats',
          onTap: () => context.read<CurrentUserCubit>().onNavigateToStats(),
        ),
        SpeedDialChild(
          child: const Icon(FontAwesomeIcons.gear),
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.black,
          label: 'Profil',
          labelShadow: [],
          labelStyle: const TextStyle(color: Colors.white),
          labelBackgroundColor: Colors.transparent,
          onTap: () => context.read<CurrentUserCubit>().onNavigateToProfile(),
        ),
        SpeedDialChild(
          child: const Icon(FontAwesomeIcons.squareUpRight),
          backgroundColor: Colors.grey[700],
          foregroundColor: Colors.black,
          labelShadow: [],
          labelStyle: const TextStyle(color: Colors.grey),
          labelBackgroundColor: Colors.transparent,
          label: 'Déconnexion',
          onTap: () => context.read<AppBloc>().add(AppLogoutRequested()),
        ),
      ],
    );
  }
}
