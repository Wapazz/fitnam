import 'package:flutter/material.dart';

class SocialSignupButton extends StatelessWidget {
  const SocialSignupButton(
      {Key? key, required this.icon, required this.title, required this.onTap})
      : super(key: key);
  final IconData icon;
  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        color: Theme.of(context).primaryColor,
        child: InkWell(
            child: Ink(
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, color: Colors.black),
                    const SizedBox(width: 20),
                    Text(
                      title,
                      style: const TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            onTap: () => onTap()),
      ),
    );
  }
}
