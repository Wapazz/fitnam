import 'package:fitnam/bloc/app/app_bloc.dart';
import 'package:fitnam/bloc/current_user/current_user_cubit.dart';
import 'package:fitnam/data/models/fit_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slide_to_act/slide_to_act.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

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
                      "assets/onboarding_bg.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    alignment: const Alignment(0, 0.2),
                    child: Text(
                      "Creer ton programme",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: const Alignment(0, 0.4),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        "Enregistre ton programme personnel de musculation jour par jour et laisse ensuite Fitnam guider des sessions à la salle.",
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ),
                  ),
                  Container(
                      alignment: const Alignment(0, 0.9),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: SizedBox(
                          height: 100,
                          child: Builder(
                            builder: (context) {
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SlideAction(
                                  borderRadius: 0,
                                  onSubmit: () {
                                    context
                                        .read<CurrentUserCubit>()
                                        .completeOnboarding();
                                  },
                                  innerColor: Theme.of(context).primaryColor,
                                  outerColor: Colors.grey[800],
                                  text: "  Demarrer maintenant",
                                  textStyle: TextStyle(
                                      fontSize: 14,
                                      color: Theme.of(context).primaryColor),
                                ),
                              );
                            },
                          ),
                        ),
                      )),
                ],
              ),
            );
          },
        ));

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Onboarding"),
    //     actions: [
    //       IconButton(
    //           onPressed: () =>
    //               context.read<AppBloc>().add(AppLogoutRequested()),
    //           icon: Icon(FontAwesomeIcons.rightToBracket))
    //     ],
    //   ),
    //   body: BlocBuilder<OnboardingCubit, OnboardingState>(
    //     builder: (context, state) {
    //       return SingleChildScrollView(
    //         child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             Text("Bonjour l'appli sert a ci et ca"),
    //             Builder(
    //               builder: (context) {
    //                 return Padding(
    //                   padding: const EdgeInsets.all(10.0),
    //                   child: SlideAction(
    //                     onSubmit: () {
    //                       context
    //                           .read<CurrentUserCubit>()
    //                           .completeOnboarding(state.data, user);
    //                     },
    //                     innerColor: Theme.of(context).primaryColor,
    //                     outerColor: Colors.black,
    //                     text: "Demarrer maintenant",
    //                   ),
    //                 );
    //               },
    //             ),
    //           ],
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
