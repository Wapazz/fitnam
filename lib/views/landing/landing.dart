import 'package:fitnam/bloc/app/app_bloc.dart';
import 'package:fitnam/views/landing/widgets/google_sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage(child: LandingPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Center(
          child: state.status == AppStatus.authLoading
              ? const CircularProgressIndicator()
              : const GoogleLoginButton(),
        );
      },
    ));
  }
}
