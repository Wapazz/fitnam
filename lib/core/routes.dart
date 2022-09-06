import 'package:fitnam/bloc/app/app_bloc.dart';
import 'package:fitnam/bloc/current_user/current_user_cubit.dart';
import 'package:fitnam/views/common/auth_container.dart';
import 'package:fitnam/views/home/home.dart';
import 'package:fitnam/views/landing/landing.dart';
import 'package:fitnam/views/profile/profile.dart';
import 'package:fitnam/views/session/session.dart';
import 'package:fitnam/views/stats/stats.dart';
import 'package:fitnam/views/weighting/weighting.dart';
import 'package:flutter/widgets.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.home:
      return [AuthContainer.page()];
    // case AppStatus.stats:
    //   return [HomePage.page()];
    // case AppStatus.profile:
    //   return [HomePage.page()];
    // case AppStatus.weighting:
    //   return [HomePage.page()];
    // case AppStatus.workout:
    //   return [HomePage.page()];
    default:
      return [LandingPage.page()];
  }
}

// List<Page<dynamic>> onGenerateNavigationPages(
//   AppNavigation state,
//   List<Page<dynamic>> pages,
// ) {
//   switch (state) {
//     case AppNavigation.home:
//       return [...pages, HomePage.page()];
//     case AppNavigation.stats:
//       return [...pages, HomePage.page(), StatsPage.page()];
//     case AppNavigation.settings:
//       return [...pages, HomePage.page(), ProfilePage.page()];
//     case AppNavigation.weighting:
//       return [...pages, HomePage.page(), WeightingPage.page()];
//     case AppNavigation.session:
//       return [...pages, HomePage.page(), SessionPage.page()];
//     default:
//       return [...pages, LandingPage.page()];
//   }
// }
