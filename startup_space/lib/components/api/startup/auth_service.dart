import 'package:firebase_auth/firebase_auth.dart';
import 'package:startup_space/components/models/startup/startup_model.dart';
import 'package:startup_space/firestore/startup_creation.dart';
import 'package:startup_space/locator.dart';

class StartupService {}

final FirebaseAuth _startupAuth = FirebaseAuth.instance;
final FirestoreInstance _firestoreInstance = locator<FirestoreInstance>();

StartupModel? _currentStartup;
StartupModel? get currentStartup => _currentStartup;

Future loginWithEmailAndPassword(StartupModel? startup) async {
  try {
    var authResult = await _startupAuth.signInWithEmailAndPassword(
      email: startup!.email.toString(),
      password: startup.password.toString(),
    );
    await _populateCurrentStartup(authResult.user!);
    return authResult.user != null;
  } catch (e) {
    return e;
  }
}

Future signUpWithEmailAndPassword(StartupModel? startup) async {
  try {
    var authResult = await _startupAuth.createUserWithEmailAndPassword(
      email: startup!.email.toString(),
      password: startup.password.toString(),
    );

    //create a new startup profile on firestore
    _currentStartup = StartupModel(startupId: authResult.user!.uid);

    await _firestoreInstance.createStartup(_currentStartup!);
    return authResult.user != null;
  } catch (e) {
    return e;
  }
}

Future<bool> isStartupLoggedIn() async {
  var startup = _startupAuth.currentUser;
  await _populateCurrentStartup(startup!);
  // ignore: unnecessary_null_comparison
  return startup != null;
}

Future _populateCurrentStartup(User startup) async {
  // ignore: unnecessary_null_comparison
  if (startup != null) {
    _currentStartup = await _firestoreInstance.fetchStartup(startup.uid);
  }
}
