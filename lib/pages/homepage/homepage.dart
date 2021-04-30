import 'package:flutter/material.dart';
import 'package:spacexland_graphql/constants/ui_files.dart';
import 'package:spacexland_graphql/model/appuser.dart';
import 'package:spacexland_graphql/model/launch.dart';
import 'package:spacexland_graphql/pages/homepage/widget/launchNewsTile.dart';
import '../../data/launch_fetch.dart';
import '../../provider/launches_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.user, this.changeLoadingState}) : super(key: key);
  final AppUser user;
  final Function changeLoadingState;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  VoidCallback refetchQuery;
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
    return GraphQLProvider(
      client: Config.initialClient(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    widget.changeLoadingState();
                    pastLaunchesProvider.clearLaunches();
                    context.navigator.pop();
                  }),
              title: Text("Welcome ${widget.user.userName}"),
              bottom: TabBar(
                tabs: [
                  Tab(child: Text("Past Launches")),
                  Tab(child: Text("Liked Launches")),
                ],
              ),
            ),
            body: TabBarView(children: [
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
            ]),
            // bottomNavigationBar: BottomNavigationBar(
            //   items: [
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.place_outlined),
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.favorite),
            //     ),
            //   ],
            // ),
          ),
        ),
      ),
    );
  }
}

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
            "launchesLimit": pastLaunchesProvider.launchesList.length + 5
          },
        ))
            .then((result) {
          pastLaunchesProvider.clearLaunches();
          final returningData = result.data['launchesPast'];
          for (var launch in returningData) {
            print("loading more");
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
