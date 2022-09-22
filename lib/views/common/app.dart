import 'package:fitnam/bloc/app/app_bloc.dart';
import 'package:fitnam/bloc/current_user/current_user_cubit.dart';
import 'package:fitnam/core/routes.dart';
import 'package:fitnam/core/theme.dart';
import 'package:fitnam/data/repositories/authentication_repository.dart';
import 'package:fitnam/data/repositories/database_repository.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    DatabaseRepository db = DatabaseRepository();

    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => AppBloc(
                    authenticationRepository: _authenticationRepository,
                  )),
          BlocProvider(create: (_) => CurrentUserCubit(databaseRepository: db)),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: MaterialApp(
        theme: appTheme,
        home: FlowBuilder<AppStatus>(
          state: context.select((AppBloc bloc) => bloc.state.status),
          onGeneratePages: onGenerateAppViewPages,
        ),
      ),
    );
  }
}
