import 'package:flutter/material.dart';
import 'package:spacexland_graphql/constants/ui_files.dart';
import 'package:spacexland_graphql/model/appuser.dart';
import 'package:spacexland_graphql/model/launch.dart';
import 'package:spacexland_graphql/pages/homepage/pages/launchesPage.dart';
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
  int _currentIndex = 0;
  List pagesList = [
    LaunchesPage(),
    Container(),
  ];
  @override
  Widget build(BuildContext context) {
    final pastLaunchesProvider = context.read<PastLaunchesModel>();
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
            body: pagesList[_currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  label: "Launches",
                  icon: Icon(FontAwesome.space_shuttle).padding(bottom: 5),
                ),
                BottomNavigationBarItem(
                  label: "Rockets",
                  icon: Icon(Ionicons.md_rocket).padding(bottom: 5),
                ),
              ],
              currentIndex: _currentIndex,
              selectedItemColor: Colors.blue,
              onTap: (int i) {
                setState(() {
                  _currentIndex = i;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
