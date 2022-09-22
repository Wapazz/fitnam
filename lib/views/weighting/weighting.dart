import 'package:fitnam/bloc/current_user/current_user_cubit.dart';
import 'package:fitnam/bloc/weighting/weighting_cubit.dart';
import 'package:fitnam/data/models/fit_user.dart';
import 'package:fitnam/data/models/fit_weighting.dart';
import 'package:fitnam/views/common/widget/animated_cta.dart';
import 'package:fitnam/views/common/widget/fit_header.dart';
import 'package:fitnam/views/common/widget/secured_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/mass_slider.dart';
import 'widgets/title_with_info_button.dart';
import 'widgets/title_with_weight.dart';
import 'widgets/weight_slider.dart';

class WeightingPage extends StatelessWidget {
  const WeightingPage({Key? key, required this.user}) : super(key: key);
  final FitUser user;

  static Route route(user) => MaterialPageRoute(builder: ((context) {
        return BlocProvider(
          create: (context) => WeightingCubit(user.lastWeighting ??
              FitWeighting(
                  date: DateTime.now(),
                  kilos: 70,
                  pounds: 165,
                  muscularMass: 70,
                  fatMass: 30)),
          child: WeightingPage(user: user),
        );
      }));
  @override
  Widget build(BuildContext context) {
    return SecuredScaffold(
      body: BlocConsumer<WeightingCubit, WeightingState>(
        listener: ((context, state) {}),
        builder: (context, state) {
          return Stack(
            children: [
              SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FitHeader(
                        avatar: user.avatar,
                        title: "Pesée",
                        message:
                            "C'est le moment de noter les résultats de tous tes courageux efforts.",
                        hasClosedBottom: true,
                      ),
                      const SizedBox(height: 30),
                      TitleWithWeight(
                          weight: state.weightData.weight(user),
                          isKilos: user.europeanMetrics),
                      SizedBox(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        child: WeightSlider(
                          weight: state.weightData.weight(user),
                          isKilos: user.europeanMetrics,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const TitleWithInfobutton(title: "Masse Graisseuse"),
                      const SizedBox(height: 20),
                      MassSlider(
                          mass: state.weightData.fatMass,
                          initialValue: 25,
                          min: 2,
                          max: 60,
                          onChange: (double value) => context
                              .read<WeightingCubit>()
                              .updateFatMass(value)),
                      const TitleWithInfobutton(title: "Masse Musculaire"),
                      const SizedBox(height: 20),
                      MassSlider(
                          min: 5,
                          max: 75,
                          mass: state.weightData.muscularMass,
                          initialValue: 50,
                          onChange: (double value) => context
                              .read<WeightingCubit>()
                              .updateMuscularMass(value)),
                      const SizedBox(height: 90),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: GestureDetector(
                    child: AnimatedCTA(
                      isActive: true,
                      message: 'Sauvegarder la pesée',
                      onTap: () {
                        context
                            .read<CurrentUserCubit>()
                            .saveWeightData(state.weightData);
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
