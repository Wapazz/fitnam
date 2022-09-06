import 'package:fitnam/bloc/app/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppleLoginButton extends StatelessWidget {
  const AppleLoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: Colors.white,
      child: InkWell(
        child: Ink(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(FontAwesomeIcons.apple, color: Colors.black),
                SizedBox(width: 20),
                Text(
                  "Se connecter avec Apple  ",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        onTap: () => context.read<AppBloc>().add(AppUserGoogleLogin()),
      ),
    );
  }
}
