import 'package:firebase_auth/firebase_auth.dart';

import 'package:startup_space/components/models/consumer/user_model.dart';
import 'package:startup_space/components/models/startup/startup_registration_model.dart';
import 'package:startup_space/components/notifier/user/auth_notifier.dart';
import 'package:startup_space/pages/individuals/login.dart';
import 'package:startup_space/pages/startup/account/notifier/startup_auth_notifier.dart';
import 'package:startup_space/pages/startup/account/notifier/startup_notifier.dart';

signInStartup(StartupRegistrationModel startup,
    StartupAuthNotifier startupNotifier) async {
  UserCredential result = await FirebaseAuth.instance
      .signInWithEmailAndPassword(
        email: startup.emailAddress!.toString(),
        password: startup.password!.toString(),
      )
      // ignore: avoid_print, invalid_return_type_for_catch_error
      .catchError(
        (error) => print(error.code),
      );
  User? firebaseUser = result.user;

  if (firebaseUser != null) {
    // ignore: avoid_print
    print("Log In: $firebaseUser");
    startupNotifier.setStartup(firebaseUser);
  }
}

signupStartup(StartupRegistrationModel startup,
    StartupAuthNotifier startupNotifier) async {
  UserCredential? authResult = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(
          email: startup.emailAddress!, password: startup.password!)
      // ignore: return_of_invalid_type_from_catch_error, avoid_print
      .catchError((error) => print(error.code));

  // ignore: unnecessary_null_comparison
  if (authResult != null) {
    // ignore: deprecated_member_use
    await FirebaseAuth.instance.currentUser!
        // ignore: deprecated_member_use
        .updateDisplayName(startup.name);
    User? firebaseUser = authResult.user;

    if (firebaseUser != null) {
      await firebaseUser.reload();

      User currentUser = FirebaseAuth.instance.currentUser!;
      startupNotifier.setStartup(currentUser);
    }
  }
}

signoutStartup(StartupAuthNotifier? startupNotifier) async {
  await FirebaseAuth.instance
      .signOut()
      // ignore: avoid_print
      .catchError((error) => print(error.code));

  startupNotifier!.setStartup;
  const UserLogin();
}

initializeCurrentStartup(StartupAuthNotifier? startupNotifier) async {
  User? appUser = FirebaseAuth.instance.currentUser;
  if (appUser != null) {
    print(appUser);
    startupNotifier!.setStartup(appUser);
  }
}
