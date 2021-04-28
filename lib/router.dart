import 'package:auto_route/auto_route.dart';
import 'pages/homepage/homepage.dart';
import 'pages/userpage/userpage.dart';
import 'pages/detailspage/detailspage.dart';

@AdaptiveAutoRouter(
  routes: [
    AutoRoute(page: HomePage),
    AutoRoute(page: UserPage, initial: true),
    AutoRoute(page: DetailsPage),
  ],
)
class $AppRouter {}
