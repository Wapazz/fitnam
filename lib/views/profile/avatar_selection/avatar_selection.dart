import 'package:fitnam/bloc/avatar/avatar_cubit.dart';
import 'package:fitnam/bloc/current_user/current_user_cubit.dart';
import 'package:fitnam/core/constants.dart';
import 'package:fitnam/views/common/widget/animated_cta.dart';
import 'package:fitnam/views/common/widget/secured_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'avatar_card.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key? key, required this.avatar, required this.nbSession})
      : super(key: key);
  final String avatar;
  final int nbSession;

  static Route route(String avatar, int nbSession) =>
      MaterialPageRoute(builder: ((context) {
        return BlocProvider(
          create: (context) => AvatarCubit(avatar),
          child: AvatarPage(avatar: avatar, nbSession: nbSession),
        );
      }));

  _getNextRequirement() {
    for (int i = 0; i < avatarRequirements.length; i++) {
      if (nbSession < avatarRequirements[i]) {
        return avatarRequirements[i];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SecuredScaffold(
      body: BlocBuilder<AvatarCubit, AvatarState>(
        builder: (context, state) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Flexible(
                                child: Text(
                                  "Débloque les différents avatars en accomplissant tes séances de sport !",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                              ),
                              IconButton(
                                  onPressed: () => context
                                      .read<CurrentUserCubit>()
                                      .onNavigateBack(
                                          from: AppNavigation.backToSettings),
                                  icon: const Icon(FontAwesomeIcons.xmark))
                            ],
                          ),
                          const SizedBox(height: 20),
                          Stack(children: [
                            LinearProgressIndicator(
                              value: nbSession / _getNextRequirement(),
                              minHeight: 25,
                              backgroundColor: Colors.grey[700],
                            ),
                            SizedBox(
                              height: 25,
                              child: Center(
                                  child: Text(
                                "$nbSession / ${_getNextRequirement()}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          ]),
                          const SizedBox(height: 30),
                          GridView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: avatarData.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 20,
                                      crossAxisSpacing: 30),
                              itemBuilder: ((context, index) {
                                return AvatarCard(
                                    avatar: avatarData[index],
                                    nbSessionRequired:
                                        avatarRequirements[index],
                                    isLocked:
                                        nbSession < avatarRequirements[index],
                                    isSelected:
                                        state.avatar == avatarData[index]);
                              })),
                          const SizedBox(height: 90),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: GestureDetector(
                      child: AnimatedCTA(
                        isActive: state is AvatarModified,
                        message: 'Valider',
                        onTap: () async {
                          await context
                              .read<CurrentUserCubit>()
                              .saveAvatar(state.avatar);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
