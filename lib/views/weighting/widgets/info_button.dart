import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoButton extends StatelessWidget {
  const InfoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(100)),
      child: const Padding(
        padding: EdgeInsets.all(4.0),
        child: Icon(
          FontAwesomeIcons.info,
          color: Colors.grey,
          size: 12,
        ),
      ),
    );
  }
}
