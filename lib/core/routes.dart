import 'package:fitnam/bloc/app/app_bloc.dart';
import 'package:fitnam/views/common/auth_container.dart';
import 'package:fitnam/views/landing/landing.dart';
import 'package:flutter/widgets.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.home:
      return [AuthContainer.page()];
    default:
      return [LandingPage.page()];
  }
}
