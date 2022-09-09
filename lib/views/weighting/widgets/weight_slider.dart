import 'package:fitnam/bloc/weighting/weighting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vertical_weight_slider/vertical_weight_slider.dart';

class WeightSlider extends StatefulWidget {
  const WeightSlider({Key? key, required this.weight}) : super(key: key);
  final double weight;

  @override
  State<WeightSlider> createState() => _WeightSliderState();
}

class _WeightSliderState extends State<WeightSlider> {
  late WeightSliderController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WeightSliderController(
        initialWeight: widget.weight, minWeight: 30, interval: 0.1);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        VerticalWeightSlider(
          height: 100,
          controller: _controller,
          decoration: const PointerDecoration(
            width: 130.0,
            height: 3.0,
            largeColor: Color(0xFF898989),
            mediumColor: Color(0xFFC5C5C5),
            smallColor: Color(0xFFF0F0F0),
            gap: 30.0,
          ),
          onChanged: (double value) {
            context.read<WeightingCubit>().updateWeight(value);
          },
          indicator: Container(
            height: 3.0,
            width: 150.0,
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
