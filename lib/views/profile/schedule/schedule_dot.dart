import 'package:fitnam/data/start/workout_data.dart';
import 'package:flutter/material.dart';

class ScheduleDot extends StatefulWidget {
  const ScheduleDot(
      {Key? key,
      required this.isSelected,
      required this.index,
      required this.onTap})
      : super(key: key);
  final bool isSelected;
  final int index;
  final Function onTap;

  @override
  State<ScheduleDot> createState() => _ScheduleDotState();
}

class _ScheduleDotState extends State<ScheduleDot> {
  late bool _isActive;
  late Color _backgroundColor;
  late Color _foregroundColor;

  @override
  void didChangeDependencies() {
    _isActive = widget.isSelected;
    _backgroundColor =
        _isActive ? Theme.of(context).primaryColor : Colors.transparent;
    _foregroundColor = _isActive ? Colors.black : Colors.grey;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _isActive = !_isActive;
        _backgroundColor =
            _isActive ? Theme.of(context).primaryColor : Colors.transparent;
        _foregroundColor = _isActive ? Colors.black : Colors.grey;
        widget.onTap();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: _foregroundColor),
          color: _backgroundColor,
        ),
        height: 30,
        width: 30,
        child: Center(
            child: Text(
          weekdays[widget.index],
          style: TextStyle(color: _foregroundColor),
        )),
      ),
    );
  }
}
