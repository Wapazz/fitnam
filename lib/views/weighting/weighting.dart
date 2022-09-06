import 'package:fitnam/bloc/app/app_bloc.dart';
import 'package:fitnam/data/models/fit_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeightingPage extends StatelessWidget {
  const WeightingPage({Key? key, required this.user}) : super(key: key);
  final FitUser user;

  static Route route(user) => MaterialPageRoute(builder: ((context) {
        return WeightingPage(user: user);
      }));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weighting"),
        actions: [
          IconButton(
              onPressed: () =>
                  context.read<AppBloc>().add(AppLogoutRequested()),
              icon: Icon(FontAwesomeIcons.rightToBracket))
        ],
      ),
      body: Container(),
    );
  }
}
