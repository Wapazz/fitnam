import 'package:fitnam/bloc/app/app_bloc.dart';
import 'package:fitnam/bloc/current_user/current_user_cubit.dart';
import 'package:fitnam/data/models/fit_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage(child: HomePage());

  @override
  Widget build(BuildContext context) {
    FitUser user =
        (context.read<CurrentUserCubit>().state as CurrentUserAvailable)
            .fitUser;

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
              onPressed: () =>
                  context.read<AppBloc>().add(AppLogoutRequested()),
              icon: Icon(FontAwesomeIcons.rightToBracket))
        ],
      ),
      floatingActionButton: SpeedDial(
        icon: FontAwesomeIcons.a,
        activeIcon: FontAwesomeIcons.accessibleIcon,
        overlayColor: Colors.black,
        overlayOpacity: 0.7,
        children: [
          SpeedDialChild(
            child: const Icon(FontAwesomeIcons.handFist),
            backgroundColor: Colors.red,
            labelBackgroundColor: Colors.transparent,
            labelShadow: [],
            foregroundColor: Colors.white,
            label: 'Seance',
            onTap: () =>
                context.read<CurrentUserCubit>().onNavigateToSession(user),
            onLongPress: () => debugPrint('FIRST CHILD LONG PRESS'),
          ),
          SpeedDialChild(
            child: const Icon(FontAwesomeIcons.weightScale),
            backgroundColor: Colors.black,
            labelStyle: const TextStyle(color: Colors.white),
            foregroundColor: Colors.white,
            labelBackgroundColor: Colors.black,
            label: 'Pesee',
            onTap: () =>
                context.read<CurrentUserCubit>().onNavigateToWeighting(user),
            onLongPress: () => debugPrint('SECOND CHILD LONG PRESS'),
          ),
          SpeedDialChild(
            child: const Icon(FontAwesomeIcons.chartSimple),
            backgroundColor: Colors.green,
            labelShadow: [],
            labelStyle: TextStyle(color: Colors.white),
            labelBackgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            label: 'Stats',
            onTap: () =>
                context.read<CurrentUserCubit>().onNavigateToStats(user),
            onLongPress: () => debugPrint('SECOND CHILD LONG PRESS'),
          ),
          SpeedDialChild(
            child: const Icon(FontAwesomeIcons.gear),
            backgroundColor: Colors.yellow,
            foregroundColor: Colors.white,
            label: 'Settings',
            onTap: () =>
                context.read<CurrentUserCubit>().onNavigateToProfile(user),
            onLongPress: () => debugPrint('SECOND CHILD LONG PRESS'),
          ),
        ],
      ),
      body: Container(),
    );
  }
}
