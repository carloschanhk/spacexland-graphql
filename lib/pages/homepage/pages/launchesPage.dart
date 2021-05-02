import 'package:flutter/material.dart';
import 'package:spacexland_graphql/model/launch.dart';
import 'package:spacexland_graphql/pages/homepage/widget/launchNewsTile.dart';
import 'package:spacexland_graphql/pages/homepage/widget/loadMoreButton.dart';
import 'package:spacexland_graphql/provider/launches_provider.dart';
import '../../../constants/ui_files.dart';
import '../homepage.dart';

class LaunchesPage extends StatefulWidget {
  LaunchesPage({Key key}) : super(key: key);

  @override
  _LaunchesPageState createState() => _LaunchesPageState();
}

class _LaunchesPageState extends State<LaunchesPage> {
  PastLaunchesModel pastLaunchesProvider;
  LikedLaunchesModel likedLaunchesProvider;
  bool loading = false;

  likeLaunchToggle(Launch launch) {
    if (launch.isLiked) {
      context.read<LikedLaunchesModel>().deleteLaunches(launch);
    } else {
      context.read<LikedLaunchesModel>().addLaunches(launch);
    }
    setState(() {
      launch.isLiked = !launch.isLiked;
    });
  }

  void _changeLoadingState() {
    setState(() {
      loading = !loading;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pastLaunchesProvider = context.watch<PastLaunchesModel>();
    final likedLaunchesProvider = context.watch<LikedLaunchesModel>();
    return TabBarView(
      children: [
        SingleChildScrollView(
          child: Column(children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: pastLaunchesProvider.launchesList.length,
              itemBuilder: (context, index) {
                return LaunchNewsTile(
                  launch: pastLaunchesProvider.launchesList[index],
                  likeLaunchToggle: likeLaunchToggle,
                ).padding(horizontal: 10, vertical: 5);
              },
            ),
            loading
                ? CircularProgressIndicator().padding(vertical: 10)
                : LoadMoreButton(
                    pastLaunchesProvider: pastLaunchesProvider,
                    changeLoadingState: _changeLoadingState,
                  ).padding(bottom: 10),
          ]),
        ),
        Container(
          child: ListView.builder(
            itemCount: likedLaunchesProvider.launchesList.length,
            itemBuilder: (context, index) {
              return LaunchNewsTile(
                likeLaunchToggle: likeLaunchToggle,
                launch: likedLaunchesProvider.launchesList[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
