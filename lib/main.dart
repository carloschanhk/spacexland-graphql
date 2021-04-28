import 'package:flutter/material.dart';
import 'package:spacexland_graphql/pages/userpage/userpage.dart';
import 'constants/ui_files.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp.router(
    //   title: 'SpaceXLand GraphQL',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   routerDelegate: _appRouter.delegate(),
    //   routeInformationParser: _appRouter.defaultRouteParser(),
    // );
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: ExtendedNavigator<AppRouter>(
        router: AppRouter(),
      ),
    );
    // return MaterialApp(
    //   title: 'spaceX',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: UserPage(),
    // );
  }
}
