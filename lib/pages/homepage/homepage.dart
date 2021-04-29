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
  PastLaunchesModel launchesProvider;

  @override
  Widget build(BuildContext context) {
    final launchesProvider = context.watch<PastLaunchesModel>();
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
                child: ListView.builder(
                  itemCount: launchesProvider.launchesList.length,
                  itemBuilder: (context, index) {
                    return LaunchNewsTile(
                      launch: launchesProvider.launchesList[index],
                    ).padding(
                      horizontal: 10,
                      vertical: 5,
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
