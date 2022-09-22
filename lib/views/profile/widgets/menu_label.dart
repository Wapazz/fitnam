import 'package:flutter/material.dart';

class MenuLabel extends StatelessWidget {
  const MenuLabel(
      {Key? key,
      required this.title,
      required this.isSelected,
      required this.onTap})
      : super(key: key);
  final String title;
  final bool isSelected;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: isSelected
                    ? BorderSide(
                        color: Theme.of(context).primaryColor, width: 3)
                    : BorderSide.none)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
