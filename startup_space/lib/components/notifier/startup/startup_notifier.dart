import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:startup_space/components/models/startup/startup_model.dart';

class StartupNotifier with ChangeNotifier {
  List<StartupModel> _startupList = [];
  late StartupModel _currentStartup = StartupModel();

  UnmodifiableListView<StartupModel> get startupList =>
      UnmodifiableListView(_startupList);

  StartupModel get currentStartup => _currentStartup;

  set startupList(List<StartupModel> startupList) {
    _startupList = startupList;
    notifyListeners();
  }

  set currentStartup(StartupModel startup) {
    _currentStartup = startup;
    notifyListeners();
  }

  addStartup(StartupModel startup) {
    _startupList.insert(0, startup);
  }

  deleteStartup(StartupModel startup) {
    _startupList
        .removeWhere((_startup) => _startup.startupname == startup.startupname);
    notifyListeners();
  }
}
