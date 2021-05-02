import 'package:flutter/material.dart';
import 'package:spacexland_graphql/model/launch.dart';
import 'package:spacexland_graphql/provider/launches_provider.dart';
import '../constants/ui_files.dart';

class LikeButton extends StatefulWidget {
  LikeButton({Key key, this.launch}) : super(key: key);
  final Launch launch;

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  void likeToggle(Launch launch) {
    if (launch.isLiked) {
      context.read<LikedLaunchesModel>().deleteLaunches(launch);
    } else {
      context.read<LikedLaunchesModel>().addLaunches(launch);
    }
    setState(() {
      launch.isLiked = !launch.isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        final SnackBar likeSnackBar = SnackBar(
          duration: Duration(seconds: 1),
          content: Text(
            "${widget.launch.missionName} ${widget.launch.isLiked ? 'removed from' : 'added to'} favorite",
          ),
        );
        likeToggle(widget.launch);
        ScaffoldMessenger.of(context).showSnackBar(likeSnackBar);
      },
      icon: Icon(widget.launch.isLiked ? Icons.favorite : Icons.favorite_border,
          color: Colors.red[300]),
    );
  }
}
