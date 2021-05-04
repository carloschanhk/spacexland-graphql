import 'package:auto_route/auto_route_annotations.dart';
import 'package:spacexland_graphql/pages/detailspage/rocketDetailPage.dart';
import 'pages/homepage/homepage.dart';
import 'pages/userpage/userpage.dart';
import 'pages/detailspage/detailspage.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: HomePage),
    AutoRoute(page: UserPage, initial: true),
    AutoRoute(page: DetailsPage),
    AutoRoute(page: RocketDetailPage),
  ],
)
class $AppRouter {}
