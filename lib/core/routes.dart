import 'package:fitnam/bloc/app/app_bloc.dart';
import 'package:fitnam/views/home/home.dart';
import 'package:fitnam/views/landing/landing.dart';
import 'package:flutter/widgets.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    default:
      return [LandingPage.page()];
  }
}
