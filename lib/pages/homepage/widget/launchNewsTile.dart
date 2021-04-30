import 'package:flutter/material.dart';
import 'package:spacexland_graphql/model/launch.dart';
import 'package:spacexland_graphql/provider/launches_provider.dart';
import '../../../constants/ui_files.dart';

class LaunchNewsTile extends StatelessWidget {
  const LaunchNewsTile({
    Key key,
    this.launch,
    this.likeLaunchToggle,
  }) : super(key: key);

  final Launch launch;
  final Function likeLaunchToggle;

  @override
  Widget build(BuildContext context) {
    final launchListProvider = context.watch<PastLaunchesModel>();
    final likedListProvider = context.watch<LikedLaunchesModel>();
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
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          LikedButton(
                            launch: launch,
                            likeLaunchToggle: likeLaunchToggle,
                          ),
                          DeleteButton(
                            launch: launch,
                            launchListProvider: launchListProvider,
                            likedListProvider: likedListProvider,
                          ),
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

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    Key key,
    @required this.launch,
    @required this.launchListProvider,
    this.likedListProvider,
  }) : super(key: key);

  final Launch launch;
  final PastLaunchesModel launchListProvider;
  final LikedLaunchesModel likedListProvider;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        int index;
        final SnackBar deleteSnackBar = SnackBar(
          content: Text("Removed ${launch.missionName} from list."),
          action: SnackBarAction(
              label: "Undo",
              onPressed: () {
                launchListProvider.addLaunches(launch, index: index);
              }),
        );
        index = launchListProvider.launchesList.indexOf(launch);
        launchListProvider.deleteLaunches(launch);
        likedListProvider.deleteLaunches(launch);

        ScaffoldMessenger.of(context).showSnackBar(deleteSnackBar);
      },
      icon: Icon(Icons.delete, color: Colors.blue).padding(horizontal: 10),
    );
  }
}

class LikedButton extends StatelessWidget {
  const LikedButton({
    Key key,
    @required this.launch,
    @required this.likeLaunchToggle,
  }) : super(key: key);

  final Launch launch;
  final Function likeLaunchToggle;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        final SnackBar likeSnackBar = SnackBar(
          duration: Duration(seconds: 1),
          content: Text(
            "${launch.missionName} ${launch.isLiked ? 'removed from' : 'added to'} favorite",
          ),
        );
        likeLaunchToggle(launch);
        ScaffoldMessenger.of(context).showSnackBar(likeSnackBar);
      },
      icon: Icon(launch.isLiked ? Icons.favorite : Icons.favorite_border,
          color: Colors.red[300]),
    );
  }
}
