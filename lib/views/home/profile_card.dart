import 'package:fitnam/bloc/current_user/current_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10, top: 16),
      child: InkWell(
        onTap: () {
          context.read<CurrentUserCubit>().onNavigateToProfile();
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[900],
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(2, 2),
                blurRadius: 10.0,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15.0),
            child: Row(
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: const [
                        Icon(FontAwesomeIcons.gear),
                      ]),
                      const SizedBox(height: 5),
                      const Text(
                        "Programme & entraînement",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                          "Configure ton programme d'entraînement et tes exercices pour les retrouver lors de ta première séance.",
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                  child: Icon(
                    FontAwesomeIcons.chevronRight,
                    size: 20,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
