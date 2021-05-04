import 'package:flutter/material.dart';
import 'package:spacexland_graphql/model/launch.dart';
import 'package:spacexland_graphql/provider/rockets_provider.dart';
import '../../../constants/ui_files.dart';

class RocketsPage extends StatelessWidget {
  const RocketsPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RocketsModel rocketProvider = context.watch<RocketsModel>();
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  color: Colors.blue,
                  child: Text(
                    "SpaceX Rockets",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: rocketProvider.rocketList.length,
            itemBuilder: (context, index) {
              return RocketTile(rocket: rocketProvider.rocketList[index]);
            },
          )
        ],
      ),
    );
  }
}

class RocketTile extends StatelessWidget {
  const RocketTile({
    Key key,
    this.rocket,
  }) : super(key: key);
  final Rocket rocket;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.navigator.push(
          Routes.rocketDetailPage,
          arguments: RocketDetailPageArguments(rocket: rocket),
        );
      },
      child: ListTile(
        leading: Icon(Ionicons.md_rocket),
        title: Text("${rocket.name}"),
      ),
    );
  }
}
