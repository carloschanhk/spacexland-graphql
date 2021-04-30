import 'package:flutter/material.dart';
import 'package:spacexland_graphql/pages/userpage/userpage.dart';
import 'package:spacexland_graphql/provider/launches_provider.dart';
import 'constants/ui_files.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PastLaunchesModel()),
        ChangeNotifierProvider(create: (context) => LikedLaunchesModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: ExtendedNavigator<AppRouter>(
        router: AppRouter(),
      ),
    );
  }
}
