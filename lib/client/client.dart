import 'package:flutter/cupertino.dart';
import '../constants/ui_files.dart';

class Config {
  static final HttpLink httpLink = HttpLink(
    'https://api.spacex.land/graphql/',
  );

  static final WebSocketLink webSocketLink = WebSocketLink(
    'wws://api.spacex.land/graphql/',
    config: SocketClientConfig(
      autoReconnect: true,
      inactivityTimeout: Duration(seconds: 30),
    ),
  );

  static Link link = httpLink.concat(webSocketLink);

  static get client => GraphQLClient(link: link, cache: GraphQLCache());

  static ValueNotifier<GraphQLClient> initialClient() {
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        cache: GraphQLCache(),
        link: link,
      ),
    );
    return client;
  }
}
