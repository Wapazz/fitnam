import 'package:fitnam/bloc/avatar/avatar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard(
      {Key? key,
      required this.avatar,
      required this.nbSessionRequired,
      required this.isLocked,
      required this.isSelected})
      : super(key: key);
  final String avatar;
  final int nbSessionRequired;
  final bool isLocked;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned.fill(
        child: CircleAvatar(
          backgroundColor: isSelected ? Colors.white : Colors.transparent,
          backgroundImage: AssetImage("assets/avatar/$avatar"),
        ),
      ),
      Positioned.fill(
          child: GestureDetector(
        onTap: isLocked
            ? null
            : () => context.read<AvatarCubit>().selectAvatar(avatar),
        child: CircleAvatar(
          backgroundColor: isLocked ? Colors.black54 : Colors.transparent,
        ),
      )),
      if (isLocked)
        Positioned.fill(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(FontAwesomeIcons.lock),
                const SizedBox(height: 5),
                Text(
                  nbSessionRequired.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                ),
              ]),
        )
    ]);
  }
}
