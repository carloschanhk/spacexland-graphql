import 'package:flutter/cupertino.dart';
import 'package:spacexland_graphql/model/launch.dart';

import '../constants/ui_files.dart';

class RocketsModel extends ChangeNotifier {
  List _rocketList = [];
  List get rocketList => _rocketList;
  void addRocket(Rocket rocket) {
    _rocketList.add(rocket);
    notifyListeners();
  }

  void removeRocket(Rocket rocket) {
    _rocketList.removeWhere((e) => e == rocket);
    notifyListeners();
  }

  void clearRocket() {
    _rocketList.clear();
    notifyListeners();
  }
}
