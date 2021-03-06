// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'model/appuser.dart';
import 'model/launch.dart';
import 'pages/detailspage/detailspage.dart';
import 'pages/detailspage/rocketDetailPage.dart';
import 'pages/homepage/homepage.dart';
import 'pages/userpage/userpage.dart';

class Routes {
  static const String homePage = '/home-page';
  static const String userPage = '/';
  static const String detailsPage = '/details-page';
  static const String rocketDetailPage = '/rocket-detail-page';
  static const all = <String>{
    homePage,
    userPage,
    detailsPage,
    rocketDetailPage,
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homePage, page: HomePage),
    RouteDef(Routes.userPage, page: UserPage),
    RouteDef(Routes.detailsPage, page: DetailsPage),
    RouteDef(Routes.rocketDetailPage, page: RocketDetailPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    HomePage: (data) {
      final args = data.getArgs<HomePageArguments>(
        orElse: () => HomePageArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => HomePage(
          key: args.key,
          user: args.user,
          changeLoadingState: args.changeLoadingState,
          userRocket: args.userRocket,
        ),
        settings: data,
      );
    },
    UserPage: (data) {
      final args = data.getArgs<UserPageArguments>(
        orElse: () => UserPageArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => UserPage(key: args.key),
        settings: data,
      );
    },
    DetailsPage: (data) {
      final args = data.getArgs<DetailsPageArguments>(
        orElse: () => DetailsPageArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => DetailsPage(
          key: args.key,
          launch: args.launch,
          isMainPage: args.isMainPage,
        ),
        settings: data,
      );
    },
    RocketDetailPage: (data) {
      final args = data.getArgs<RocketDetailPageArguments>(
        orElse: () => RocketDetailPageArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => RocketDetailPage(
          key: args.key,
          rocket: args.rocket,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// HomePage arguments holder class
class HomePageArguments {
  final Key key;
  final AppUser user;
  final Function changeLoadingState;
  final Rocket userRocket;
  HomePageArguments(
      {this.key, this.user, this.changeLoadingState, this.userRocket});
}

/// UserPage arguments holder class
class UserPageArguments {
  final Key key;
  UserPageArguments({this.key});
}

/// DetailsPage arguments holder class
class DetailsPageArguments {
  final Key key;
  final Launch launch;
  final bool isMainPage;
  DetailsPageArguments({this.key, this.launch, this.isMainPage});
}

/// RocketDetailPage arguments holder class
class RocketDetailPageArguments {
  final Key key;
  final Rocket rocket;
  RocketDetailPageArguments({this.key, this.rocket});
}
