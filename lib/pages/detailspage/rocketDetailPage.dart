import 'package:flutter/material.dart';
import 'package:spacexland_graphql/data/launch_fetch.dart';
import 'package:spacexland_graphql/model/launch.dart';
import 'package:spacexland_graphql/pages/homepage/widget/launchNewsTile.dart';
import 'package:spacexland_graphql/provider/launches_provider.dart';
import '../../constants/ui_files.dart';

class RocketDetailPage extends StatefulWidget {
  RocketDetailPage({Key key, this.rocket}) : super(key: key);
  final Rocket rocket;

  @override
  _RocketDetailPageState createState() => _RocketDetailPageState();
}

class _RocketDetailPageState extends State<RocketDetailPage> {
  List rocketRelatedLaunchList = [];

  @override
  Widget build(BuildContext context) {
    final GraphQLClient _client = Config.client;
    final rocket = widget.rocket;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text("${rocket.name}")
                  .fontSize(20)
                  .fontWeight(FontWeight.bold)
                  .padding(bottom: 10),
            ),
            TextRow(title: "Company", info: rocket.company)
                .padding(vertical: 5),
            TextRow(title: "Country", info: rocket.country)
                .padding(vertical: 5),
            TextRow(title: "First Flight", info: rocket.firstFlight)
                .padding(vertical: 5),
            TextRow(
                    title: "Cost Per Launch",
                    info: (rocket.costPerLaunch / 1000000).toString() +
                        " Million")
                .padding(vertical: 5),
            TextRow(
                    title: "Success Rate",
                    info: rocket.successRatePct.toString() + "%")
                .padding(vertical: 5),
            Text(
              "${rocket.description}",
              style: TextStyle(height: 1.5),
            ).fontSize(16).padding(bottom: 5),
            Row(
              children: [
                Text("Read More on").fontSize(16),
                TextButton(
                  onPressed: () async {
                    await canLaunch(rocket.wikipedia)
                        ? await launch(
                            rocket.wikipedia,
                            forceWebView: true,
                          )
                        : throw 'Could not launch wikipedia';
                  },
                  child: Text("Wikipedia")
                      .fontSize(16)
                      .textColor(Colors.blue)
                      .fontWeight(FontWeight.w600),
                ),
              ],
            ),
            Text("Mission Related")
                .textColor(Colors.blue)
                .fontSize(16)
                .fontWeight(FontWeight.w600)
                .padding(vertical: 10),
            FutureBuilder(
              future: _client.query(
                QueryOptions(
                  document: gql(LaunchFetch.rocketLaunchesFetch),
                  variables: {
                    "launchesLimit": 5,
                    "skip": rocketRelatedLaunchList.length,
                    "rocketName": rocket.name
                  },
                ),
              ),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  for (var launch in snapshot.data.data["launchesPast"]) {
                    rocketRelatedLaunchList.add(Launch.fromJson(launch));
                  }
                  print(rocketRelatedLaunchList);
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: rocketRelatedLaunchList.length,
                    itemBuilder: (context, index) {
                      print(index);
                      return LaunchNewsTile(
                        launch: rocketRelatedLaunchList[index],
                        isMainPage: false,
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text("Cannot load rocket\'s mission");
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ).padding(horizontal: 20, top: 10),
      ),
    );
  }
}

class TextRow extends StatelessWidget {
  const TextRow({
    Key key,
    this.title,
    this.info,
  }) : super(key: key);
  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("$title: ")
            .fontSize(16)
            .textColor(Colors.blue)
            .fontWeight(FontWeight.w600),
        Text("$info").fontSize(16),
      ],
    );
  }
}
