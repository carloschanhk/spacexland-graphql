// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i5;
import 'package:spacexland_graphql/pages/detailspage/detailspage.dart' as _i4;
import 'package:spacexland_graphql/pages/homepage/homepage.dart' as _i2;
import 'package:spacexland_graphql/pages/userpage/userpage.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    HomePageRoute.name: (entry) {
      var args = entry.routeData
          .argsAs<HomePageRouteArgs>(orElse: () => HomePageRouteArgs());
      return _i1.AdaptivePage(entry: entry, child: _i2.HomePage(key: args.key));
    },
    UserPageRoute.name: (entry) {
      var args = entry.routeData
          .argsAs<UserPageRouteArgs>(orElse: () => UserPageRouteArgs());
      return _i1.AdaptivePage(entry: entry, child: _i3.UserPage(key: args.key));
    },
    DetailsPageRoute.name: (entry) {
      var args = entry.routeData
          .argsAs<DetailsPageRouteArgs>(orElse: () => DetailsPageRouteArgs());
      return _i1.AdaptivePage(
          entry: entry, child: _i4.DetailsPage(key: args.key));
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(HomePageRoute.name, path: '/home-page'),
        _i1.RouteConfig(UserPageRoute.name, path: '/'),
        _i1.RouteConfig(DetailsPageRoute.name, path: '/details-page')
      ];
}

class HomePageRoute extends _i1.PageRouteInfo<HomePageRouteArgs> {
  HomePageRoute({_i5.Key key})
      : super(name, path: '/home-page', args: HomePageRouteArgs(key: key));

  static const String name = 'HomePageRoute';
}

class HomePageRouteArgs {
  const HomePageRouteArgs({this.key});

  final _i5.Key key;
}

class UserPageRoute extends _i1.PageRouteInfo<UserPageRouteArgs> {
  UserPageRoute({_i5.Key key})
      : super(name, path: '/', args: UserPageRouteArgs(key: key));

  static const String name = 'UserPageRoute';
}

class UserPageRouteArgs {
  const UserPageRouteArgs({this.key});

  final _i5.Key key;
}

class DetailsPageRoute extends _i1.PageRouteInfo<DetailsPageRouteArgs> {
  DetailsPageRoute({_i5.Key key})
      : super(name,
            path: '/details-page', args: DetailsPageRouteArgs(key: key));

  static const String name = 'DetailsPageRoute';
}

class DetailsPageRouteArgs {
  const DetailsPageRouteArgs({this.key});

  final _i5.Key key;
}
