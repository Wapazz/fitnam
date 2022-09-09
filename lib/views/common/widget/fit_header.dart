import 'package:fitnam/bloc/current_user/current_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FitHeader extends StatelessWidget {
  const FitHeader(
      {Key? key,
      required this.avatar,
      required this.title,
      required this.message,
      required this.hasClosedBottom})
      : super(key: key);
  final String avatar;
  final String title;
  final String message;
  final bool hasClosedBottom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          SizedBox(height: 80, child: Image.asset("assets/avatar/$avatar")),
          const SizedBox(width: 10),
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Flexible(
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: GoogleFonts.arsenal(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  // if (hasClosedBottom)
                  //   Expanded(
                  //     child: Container(
                  //       // child: const Spacer(),
                  //       color: Colors.pink,
                  //     ),
                  //   ),
                  if (hasClosedBottom)
                    IconButton(
                        onPressed: () =>
                            context.read<CurrentUserCubit>().onNavigateBack(),
                        icon: const Icon(
                          FontAwesomeIcons.xmark,
                          color: Colors.white,
                        ))
                ],
              ),
              Text(
                message,
                style: GoogleFonts.inter(color: Colors.white, fontSize: 12),
              )
            ],
          ))
        ],
      ),
    );
  }
}