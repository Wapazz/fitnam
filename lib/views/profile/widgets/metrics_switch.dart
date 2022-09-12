import 'package:flutter/material.dart';

class MetricsSwitch extends StatefulWidget {
  const MetricsSwitch({Key? key, required this.onTap, required this.state})
      : super(key: key);
  final Function onTap;
  final bool state;

  @override
  State<MetricsSwitch> createState() => _MetricsSwitchState();
}

class _MetricsSwitchState extends State<MetricsSwitch> {
  late bool _left;
  late double _rightMargin;
  late double _leftMargin;

  final double _height = 35;
  final double _width = 120;
  final double _padding = 3;

  @override
  void didChangeDependencies() {
    _left = widget.state;
    _rightMargin = _left ? _width / 2 : 0;
    _leftMargin = _left ? 0 : _width / 2;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: const Color(0xFF636363),
          height: _height,
          width: _width,
        ),
        AnimatedPositioned(
            curve: Curves.decelerate,
            right: _rightMargin,
            left: _leftMargin,
            duration: const Duration(milliseconds: 300),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                color: Theme.of(context).primaryColor,
                width: _width / 2 - _padding * 2,
                height: _height - _padding * 2,
              ),
            )),
        SizedBox(
          width: _width,
          height: _height,
          child: InkWell(
            onTap: (() {
              setState(() {
                _left = !_left;
                _rightMargin = _left ? _width / 2 : 0;
                _leftMargin = _left ? 0 : _width / 2;
                widget.onTap(_left);
              });
            }),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Flexible(child: Text("Kg")),
                Flexible(child: Text("Lbs")),
              ],
            ),
          ),
        )
      ],
    );
  }
}
