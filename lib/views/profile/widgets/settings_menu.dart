import 'package:fitnam/bloc/profile/profile_cubit.dart';
import 'package:fitnam/data/start/workout_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'menu_label.dart';

class SettingsMenu extends StatelessWidget {
  const SettingsMenu({Key? key, required this.selectedIndex}) : super(key: key);
  final int selectedIndex;

  List<Widget> _buildMenuIndexes(BuildContext context) {
    List<String> menus = [
      "Programme",
      ...programData.map((e) => workoutNameFromId(e.name)),
      "Unités"
    ];
    List<Widget> menusWidgets = [];
    for (int i = 0; i < menus.length; i++) {
      menusWidgets.add(MenuLabel(
        title: menus[i],
        isSelected: selectedIndex == i,
        onTap: () => context.read<ProfileCubit>().selectIndex(i),
      ));
    }
    return menusWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        primary: false,
        shrinkWrap: true,
        children: [
          ..._buildMenuIndexes(context),
        ],
      ),
    );
  }
}
