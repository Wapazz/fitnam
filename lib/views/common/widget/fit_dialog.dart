import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class FitDialog extends StatelessWidget {
  const FitDialog(
      {Key? key,
      this.onCancel,
      required this.onConfirm,
      required this.title,
      required this.message,
      this.confirmTitle})
      : super(key: key);
  final Function? onCancel;
  final Function? onConfirm;
  final String title;
  final String message;
  final String? confirmTitle;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: GoogleFonts.arsenal(
            color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
      ),
      content: const Text(
        "Vous allez supprimer un exercice et toutes les donnees associees a celui ci.\nEtes vous sur de vouloir le supprimer ?",
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        GestureDetector(
          onTap: () {
            if (onCancel != null) {
              onCancel!();
            }
            Navigator.pop(context);
          },
          child: Container(
              color: Theme.of(context).primaryColor,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
                child: Text("Annuler"),
              )),
        ),
        if (onConfirm != null)
          GestureDetector(
            onTap: () {
              onConfirm!();
              Navigator.pop(context);
            },
            child: Text(
              confirmTitle ?? 'OK',
              style: const TextStyle(color: Colors.white),
            ),
          ),
      ],
      actionsPadding: const EdgeInsets.only(bottom: 10),
    );
  }
}
