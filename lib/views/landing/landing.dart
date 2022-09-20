import 'package:fitnam/bloc/app/app_bloc.dart';
import 'package:fitnam/views/landing/widgets/apple_sign_in_button.dart';
import 'package:fitnam/views/landing/widgets/google_sign_in_button.dart';
import 'package:fitnam/views/landing/widgets/social_signup_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage(child: LandingPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return Container(
              color: Colors.black,
              child: Stack(
                children: [
                  Positioned(
                    child: Image.asset(
                      "assets/landing_bg.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    alignment: const Alignment(0, -0.35),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width / 5),
                      child: Image.asset(
                        "assets/logo.png",
                      ),
                    ),
                  ),
                  Container(
                      alignment: const Alignment(0, 0.4),
                      child: state.status == AppStatus.authLoading
                          ? const CircularProgressIndicator()
                          : SocialSignupButton(
                              icon: FontAwesomeIcons.google,
                              title: "Se connecter avec Google",
                              onTap: () => context
                                  .read<AppBloc>()
                                  .add(AppUserGoogleLogin()))),
                  Container(
                      alignment: const Alignment(0, 0.6),
                      child: state.status == AppStatus.authLoading
                          ? const CircularProgressIndicator()
                          : SocialSignupButton(
                              icon: FontAwesomeIcons.apple,
                              title: "Se connecter avec Apple",
                              onTap: () {})),
                  Container(
                      alignment: const Alignment(0, 0.9),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.0),
                        child: Text(
                          'Un compte est obligatoire pour accéder à l’application et suivre tes progrès.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      )),
                ],
              ),
            );
          },
        ));
  }
}
