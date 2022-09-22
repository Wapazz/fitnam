import 'package:fitnam/bloc/profile/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/metrics_switch.dart';

class UnitsPage extends StatelessWidget {
  const UnitsPage({Key? key, required this.usesEuropeanMetrics})
      : super(key: key);
  final bool usesEuropeanMetrics;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              const Text("Unité de poids",
                  style: TextStyle(color: Colors.grey)),
              const Spacer(),
              MetricsSwitch(
                  onTap: (value) =>
                      context.read<ProfileCubit>().updateMetricSettings(value),
                  state: usesEuropeanMetrics),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ]),
    );
  }
}
