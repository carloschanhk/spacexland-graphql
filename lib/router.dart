import 'package:auto_route/auto_route.dart';
import 'pages/homepage.dart';
import 'pages/onlinePost.dart';

@AdaptiveAutoRouter(routes:[
  AutoRoute(page: HomePage, initial: true),
  AutoRoute(page: OnlinePost),
],)
class $FlutterRouter{}
