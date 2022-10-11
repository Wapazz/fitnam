import 'package:fitnam/bloc/current_user/current_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FitHeader extends StatelessWidget {
  const FitHeader({
    Key? key,
    required this.avatar,
    required this.title,
    required this.message,
    required this.hasClosedBottom,
    this.isEditable = false,
    this.nbSession = 0,
  }) : super(key: key);
  final String avatar;
  final String title;
  final String message;
  final bool hasClosedBottom;
  final bool isEditable;
  final int nbSession;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (hasClosedBottom)
          GestureDetector(
            onTap: () => context.read<CurrentUserCubit>().onNavigateBack(),
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0, top: 8),
              child: Icon(
                FontAwesomeIcons.xmark,
                color: Colors.white,
              ),
            ),
          ),
        // IconButton(
        //     padding: EdgeInsets.zero,
        //     onPressed: () =>
        //         context.read<CurrentUserCubit>().onNavigateBack(),
        //     icon: const Padding(
        //       padding: EdgeInsets.only(right: 5.0),
        //       child: Icon(
        //         FontAwesomeIcons.xmark,
        //         color: Colors.white,
        //       ),
        //     )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Row(
            children: [
              GestureDetector(
                onTap: !isEditable
                    ? null
                    : () =>
                        context.read<CurrentUserCubit>().onNavigateToAvatar(),
                child: !isEditable
                    ? SizedBox(
                        height: 80, child: Image.asset("assets/avatar/$avatar"))
                    : SizedBox(
                        height: 90,
                        child: Stack(
                          children: [
                            SizedBox(
                                height: 80,
                                child: Image.asset("assets/avatar/$avatar")),
                            Positioned(
                              bottom: 0,
                              left: 24,
                              child: CircleAvatar(
                                radius: 16,
                                backgroundColor: Colors.grey[700],
                                child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    child: const Padding(
                                      padding: EdgeInsets.all(2.0),
                                      child: Icon(
                                        FontAwesomeIcons.pencil,
                                        color: Colors.white,
                                        size: 12,
                                      ),
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
              ),
              const SizedBox(width: 10),
              Flexible(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                          style: GoogleFonts.arsenal(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
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
        ),
      ],
    );
  }
}
