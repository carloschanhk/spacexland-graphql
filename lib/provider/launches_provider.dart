import 'package:flutter/cupertino.dart';
import 'package:spacexland_graphql/model/launch.dart';

import '../constants/ui_files.dart';

class LaunchesModel extends ChangeNotifier {
  List _launchesList = [];

  List get launchesList => _launchesList;

  void addLaunches(Launch launch) {
    _launchesList.add(launch);
    notifyListeners();
  }

  void clearLaunches() {
    _launchesList.clear();
    notifyListeners();
  }
}
