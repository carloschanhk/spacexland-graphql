import 'package:flutter/material.dart';
import 'package:spacexland_graphql/constants/ui_files.dart';
import 'package:spacexland_graphql/model/appuser.dart';
import 'package:spacexland_graphql/model/launch.dart';
import 'package:spacexland_graphql/pages/homepage/pages/launchesPage.dart';
import 'package:spacexland_graphql/pages/homepage/widget/launchNewsTile.dart';
import '../../data/launch_fetch.dart';
import '../../provider/launches_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.user, this.changeLoadingState, this.userRocket})
      : super(key: key);
  final AppUser user;
  final Function changeLoadingState;
  final Rocket userRocket;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List appBarList;
  @override
  void initState() {
    super.initState();

    appBarList = [
      AppBar(
        leading: BackButton(changeLoadingState: widget.changeLoadingState),
        title: Text("Welcome ${widget.user.userName}"),
        bottom: TabBar(
          tabs: [
            Tab(child: Text("Past Launches")),
            Tab(child: Text("Liked Launches")),
          ],
        ),
      ),
      AppBar(
        leading: BackButton(
          changeLoadingState: widget.changeLoadingState,
        ),
        title: Text("Your Rocket: ${widget.userRocket.name}"),
        elevation: 0,
      )
    ];
  }

  int _currentIndex = 0;
  List pagesList = [
    LaunchesPage(),
    Column(children: [
      Row(
        children: [
          Expanded(
            child: Text(
              "SpaceX Rockets",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ).backgroundColor(Colors.blue).padding(vertical: 5),
          ),
        ],
      ),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: Config.initialClient(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: appBarList[_currentIndex],
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

class BackButton extends StatelessWidget {
  const BackButton({
    Key key,
    @required this.changeLoadingState,
  }) : super(key: key);

  final Function changeLoadingState;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          changeLoadingState();
          context.read<PastLaunchesModel>().clearLaunches();
          context.navigator.pop();
        });
  }
}
