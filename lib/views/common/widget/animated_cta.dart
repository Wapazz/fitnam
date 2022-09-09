import 'package:flutter/material.dart';

class AnimatedCTA extends StatefulWidget {
  const AnimatedCTA(
      {Key? key,
      required this.isActive,
      required this.onTap,
      required this.message})
      : super(key: key);
  final String message;
  final bool isActive;
  final Function onTap;

  @override
  State<AnimatedCTA> createState() => _AnimatedCTAState();
}

class _AnimatedCTAState extends State<AnimatedCTA> {
  final animationDuration = const Duration(milliseconds: 300);
  late Color _color;
  late double _padding;
  late Widget _child;
  late double _cornerRadius;

  @override
  void didChangeDependencies() {
    _color = Theme.of(context).primaryColor;
    _padding = 20;
    _cornerRadius = 0;
    _child = Text(widget.message);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: animationDuration,
      padding: EdgeInsets.symmetric(horizontal: _padding, vertical: 15),
      child: GestureDetector(
        onTap: !widget.isActive
            ? null
            : () {
                setState(() {
                  _color = const Color(0xFF424242);
                  _padding = (MediaQuery.of(context).size.width - 50) / 2;
                  _child = const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: CircularProgressIndicator(),
                  );
                  _cornerRadius = 100;
                });
                widget.onTap();
              },
        child: AnimatedContainer(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_cornerRadius),
            color: widget.isActive ? _color : const Color(0xFF424242),
          ),
          duration: animationDuration,
          child: Center(
            child: _child,
          ),
        ),
      ),
    );
  }
}
