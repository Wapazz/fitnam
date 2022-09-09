import 'package:fitnam/bloc/current_user/current_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeightingCard extends StatelessWidget {
  const WeightingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: InkWell(
        onTap: () {
          context.read<CurrentUserCubit>().onNavigateToWeighting();
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
                      SizedBox(
                        width: 60,
                        child: Image.asset(
                          "assets/avatar/default.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      Text(
                        "C'est le jour de la pesee",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      Text(
                          "Se peser une fois par semaine évite les frustrations et montre les vrais progrès.",
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                ),
                Container(
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
