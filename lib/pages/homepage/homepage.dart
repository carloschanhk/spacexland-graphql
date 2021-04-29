import 'package:flutter/material.dart';
import 'package:spacexland_graphql/constants/ui_files.dart';
import 'package:spacexland_graphql/model/appuser.dart';
import 'package:spacexland_graphql/model/launch.dart';
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
  LaunchesModel launchesProvider;

  @override
  Widget build(BuildContext context) {
    final launchesProvider = context.watch<LaunchesModel>();
    return GraphQLProvider(
      client: Config.initialClient(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    widget.changeLoadingState();
                    launchesProvider.clearLaunches();
                    context.navigator.pop();
                  }),
              title: Text("Welcome ${widget.user.userName}"),
              bottom: TabBar(
                tabs: [
                  Tab(child: Text("Past Launches")),
                  Tab(child: Text("Upcoming Launches")),
                ],
              ),
            ),
            body: TabBarView(children: [
              Container(
                // child: Query(
                //   options: QueryOptions(
                //     document: gql(LaunchFetch.pastLaunchesFetch),
                //   ),
                //   builder: (QueryResult result,
                //       {VoidCallback refetch, FetchMore fetchMore}) {
                //     refetchQuery = refetch;
                //     if (result.hasException) {
                //       return Text(result.hasException.toString());
                //     }
                //     if (result.isLoading) {
                //       return Text("loading");
                //     } else {
                //       final returningData = result.data['launchesPast'];
                //       print(returningData.length);
                //       for (var launch in returningData) {
                //         launchesProvider.addLaunches(Launch.fromJson(launch));
                //       }

                //       return ListView.builder(
                //         itemCount: launchesProvider.launchesList.length,
                //         itemBuilder: (context, index) {
                //           return ListTile(
                //             title: Text("$index"),
                //           );
                //         },
                //       );
                //     }
                //   },
                // ),
                child: ListView.builder(
                  itemCount: launchesProvider.launchesList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("$index"),
                    );
                  },
                ),
              ),
              Container()
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
