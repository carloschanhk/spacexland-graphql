import 'package:flutter/material.dart';
import 'package:spacexland_graphql/model/launch.dart';
import '../../../constants/ui_files.dart';

class LaunchNewsTile extends StatelessWidget {
  const LaunchNewsTile({
    Key key,
    this.launch,
  }) : super(key: key);

  final Launch launch;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.navigator.push(
          Routes.detailsPage,
          arguments: DetailsPageArguments(launch: launch),
        );
      },
      child: Card(
        elevation: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    child: Text(
                      "Launch Date: ${launch.formattedDate}",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    padding: EdgeInsets.only(),
                  ),
                ),
              ],
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${launch.missionName}",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                        softWrap: true,
                      ).padding(bottom: 10, top: 10).width(200),
                      launch.details == null
                          ? Container()
                          : Text(
                              "${launch.details.split(" ").sublist(0, 20).join(" ")}",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                              softWrap: true,
                            ).width(200),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: launch.links.imageList.length > 0
                            ? CachedNetworkImage(
                                width: 130,
                                height: 130,
                                fit: BoxFit.fill,
                                imageUrl: launch.links.imageList[0],
                              )
                            : Image(
                                width: 130,
                                height: 130,
                                fit: BoxFit.fill,
                                image: AssetImage(
                                    "lib/data/images/spaceX-logo.jpg"),
                              ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.bookmark_border, color: Colors.blue)
                              .padding(horizontal: 10),
                          Icon(
                            Icons.delete,
                            color: Colors.blue,
                          ).padding(horizontal: 10),
                        ],
                      ).padding(top: 5),
                    ],
                  ).padding(top: 10, right: 10)
                ],
              ),
            ),
          ],
        ).padding(horizontal: 10, vertical: 10),
      ),
    );
  }
}
