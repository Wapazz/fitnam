import 'package:flutter/material.dart';
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
      content: Text(
        message,
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
      insetPadding: const EdgeInsets.all(16),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        GestureDetector(
          onTap: () {
            if (onCancel != null) {
              onCancel!();
            }
            Navigator.pop(context);
          },
          child: Container(
            width: MediaQuery.of(context).size.width / 3,
            color: Theme.of(context).primaryColor,
            child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 6),
                child: Center(
                  child: Text("Annuler",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                )),
          ),
        ),
        if (onConfirm != null)
          GestureDetector(
            onTap: () {
              onConfirm!();
              Navigator.pop(context);
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: Center(
                child: Text(
                  confirmTitle ?? 'OK',
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
      ],
      actionsPadding: const EdgeInsets.only(bottom: 10),
    );
  }
}
