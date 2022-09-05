import 'package:fitnam/bloc/app/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      child: Ink(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                "VA T'ENTRAINER JEUNE ESCARGOT",
                style: TextStyle(color: Colors.white),
              ),
              Icon(FontAwesomeIcons.fireFlameSimple, color: Colors.white)
            ],
          ),
        ),
      ),
      onTap: () => context.read<AppBloc>().add(AppUserGoogleLogin()),
    );
  }
}
