import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class StartupAuthNotifier with ChangeNotifier {
  User? _startup;

  User? get startup => _startup;

  void setStartup(User startup) {
    _startup = startup;
    notifyListeners();
  }
}
