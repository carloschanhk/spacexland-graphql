import 'package:spacexland_graphql/model/launch.dart';

import '../../constants/ui_files.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key key, this.launch}) : super(key: key);
  final Launch launch;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  YoutubePlayerController youtubeController;
  @override
  void initState() {
    super.initState();
    youtubeController = YoutubePlayerController(
      initialVideoId:
          YoutubePlayer.convertUrlToId(widget.launch.links.videoLink),
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceMedia = MediaQuery.of(context);

    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.landscape) {
        return Scaffold(
          body: BodyWidget(
            youtubeController: youtubeController,
            deviceMedia: deviceMedia,
            launch: widget.launch,
          ),
        );
      } else {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                context.navigator.pop();
              },
            ),
            elevation: 0,
          ),
          body: BodyWidget(
            youtubeController: youtubeController,
            deviceMedia: deviceMedia,
            launch: widget.launch,
          ),
        );
      }
    });
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    Key key,
    this.youtubeController,
    this.launch,
    this.deviceMedia,
  }) : super(key: key);

  final YoutubePlayerController youtubeController;
  final Launch launch;
  final MediaQueryData deviceMedia;

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: youtubeController,
        showVideoProgressIndicator: true,
      ),
      builder: (context, player) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: launch.links.imageList.length > 0
                    ? CachedNetworkImage(
                        width: deviceMedia.size.width,
                        height: deviceMedia.size.height / 4,
                        fit: BoxFit.fill,
                        imageUrl: launch.links.imageList[0],
                      )
                    : Image(
                        width: deviceMedia.size.width,
                        fit: BoxFit.fill,
                        image: AssetImage("lib/data/images/spaceX-logo.jpg"),
                      ),
              ),
              Text(
                "${launch.missionName}",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ).padding(top: 10),
              Text(
                "${launch.details}",
                style: TextStyle(fontSize: 16, height: 1.5),
              ).padding(top: 10),
              player,
            ],
          ).padding(horizontal: 20, top: 10),
        );
      },
    );
  }
}
