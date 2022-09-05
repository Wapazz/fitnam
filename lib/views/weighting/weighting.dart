import 'package:fitnam/bloc/app/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeightingPage extends StatelessWidget {
  const WeightingPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage(child: WeightingPage());

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
