import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:startup_space/components/models/startup/startup_model.dart';
import 'package:startup_space/components/models/startup/startup_registration_model.dart';

class StartupNotifier with ChangeNotifier {
  List<StartupRegistrationModel> _startupList = [];
  StartupRegistrationModel _currentStartup = StartupRegistrationModel();

  UnmodifiableListView<StartupRegistrationModel> get startupList =>
      UnmodifiableListView(_startupList);

  StartupRegistrationModel get currentStartup => _currentStartup;

  set startupList(List<StartupRegistrationModel> startupList) {
    _startupList = startupList;
    notifyListeners();
  }

  set currentStartup(StartupRegistrationModel startup) {
    _currentStartup = startup;
    notifyListeners();
  }

  addStartup(StartupRegistrationModel startup) {
    _startupList.insert(0, startup);
  }

  deleteStartup(StartupRegistrationModel startup) {
    _startupList.removeWhere((_startup) => _startup.name == startup.name);
    notifyListeners();
  }
}
