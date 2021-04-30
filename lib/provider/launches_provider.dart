import 'package:flutter/cupertino.dart';
import 'package:spacexland_graphql/model/launch.dart';

import '../constants/ui_files.dart';

class PastLaunchesModel extends ChangeNotifier {
  List _launchesList = [];

  List get launchesList => _launchesList;

  void addLaunches(Launch launch, {int index}) {
    if (index != null) {
      _launchesList.insert(index, launch);
    } else {
      _launchesList.add(launch);
    }
    notifyListeners();
  }

  void deleteLaunches(Launch launch) {
    _launchesList.removeWhere((element) => element == launch);
    notifyListeners();
  }

  void clearLaunches() {
    _launchesList.clear();
    notifyListeners();
  }
}

class LikedLaunchesModel extends ChangeNotifier {
  List _launchesList = [];

  List get launchesList => _launchesList;

  void addLaunches(Launch launch) {
    _launchesList.add(launch);
    notifyListeners();
  }

  void deleteLaunches(Launch launch) {
    _launchesList.removeWhere((element) => element == launch);
    notifyListeners();
  }

  void clearLaunches() {
    _launchesList.clear();
    notifyListeners();
  }
}
