import 'package:fitnam/bloc/app/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        color: Colors.white,
        child: InkWell(
          child: Ink(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(FontAwesomeIcons.google, color: Colors.black),
                  SizedBox(width: 20),
                  Text(
                    "Se connecter avec Google",
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          onTap: () => context.read<AppBloc>().add(AppUserGoogleLogin()),
        ),
      ),
    );
  }
}
