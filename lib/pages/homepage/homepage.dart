import 'package:flutter/material.dart';
import 'package:spacexland_graphql/constants/ui_files.dart';
import 'package:spacexland_graphql/model/appuser.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.user, this.changeLoadingState}) : super(key: key);
  final AppUser user;
  final Function changeLoadingState;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                widget.changeLoadingState();
                context.navigator.pop();
              }),
          title: Text("Welcome ${widget.user.userName}"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "SpaceX Launches",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ],
        ).padding(horizontal: 20),
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
    );
  }
}