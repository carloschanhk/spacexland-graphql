import 'package:flutter/material.dart';
import 'package:spacexland_graphql/data/launch_fetch.dart';
import 'package:spacexland_graphql/model/launch.dart';
import 'package:spacexland_graphql/provider/launches_provider.dart';
import '../../../constants/ui_files.dart';

class LoadMoreButton extends StatelessWidget {
  const LoadMoreButton({
    Key key,
    @required this.pastLaunchesProvider,
    this.changeLoadingState,
  }) : super(key: key);

  final PastLaunchesModel pastLaunchesProvider;
  final Function changeLoadingState;

  @override
  Widget build(BuildContext context) {
    final GraphQLClient _client = GraphQLProvider.of(context).value;
    return ElevatedButton(
      onPressed: () {
        changeLoadingState();
        _client
            .query(QueryOptions(
          document: gql(LaunchFetch.pastLaunchesFetch),
          variables: {
            "launchesLimit": 5,
            "skip": pastLaunchesProvider.launchesList.length
          },
        ))
            .then((result) {
          //pastLaunchesProvider.clearLaunches();
          final returningData = result.data['launchesPast'];
          for (var launch in returningData) {
            pastLaunchesProvider.addLaunches(Launch.fromJson(launch));
          }
        }).whenComplete(() {
          changeLoadingState();
        });
      },
      child: Text("Load More").padding(vertical: 12),
    );
  }
}
