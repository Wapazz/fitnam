import 'package:fitnam/bloc/current_user/current_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecuredScaffold extends StatelessWidget {
  const SecuredScaffold(
      {Key? key, required this.body, this.navigation = AppNavigation.home})
      : super(key: key);
  final Widget body;
  final AppNavigation navigation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: WillPopScope(
            onWillPop: () async {
              context.read<CurrentUserCubit>().onNavigateBack(from: navigation);
              return true;
            },
            child: body));
  }
}
