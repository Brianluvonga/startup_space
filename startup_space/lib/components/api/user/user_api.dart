import 'package:firebase_auth/firebase_auth.dart';
import 'package:startup_space/components/models/consumer/user_model.dart';
import 'package:startup_space/components/notifier/user/auth_notifier.dart';
import 'package:startup_space/pages/individuals/login.dart';

// contains both login and registration components

//
//
//
signIn(UserModel user, AuthNotifier authNotifier) async {
  UserCredential result = await FirebaseAuth.instance
      .signInWithEmailAndPassword(
          email: user.email!.toString(), password: user.password!.toString())
      // ignore: avoid_print, invalid_return_type_for_catch_error
      .catchError((error) => print(error.code));
  User? firebaseUser = result.user;

  if (firebaseUser != null) {
    // ignore: avoid_print
    print("Log In: $firebaseUser");
    authNotifier.setUser(firebaseUser);
  }
}

signup(UserModel user, AuthNotifier authNotifier) async {
  UserCredential? authResult = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(
          email: user.email!, password: user.password!)
      // ignore: return_of_invalid_type_from_catch_error, avoid_print
      .catchError((error) => print(error.code));

  // ignore: unnecessary_null_comparison
  if (authResult != null) {
    // ignore: deprecated_member_use
    await FirebaseAuth.instance.currentUser!
        // ignore: deprecated_member_use
        .updateDisplayName(user.displayName);
    User? firebaseUser = authResult.user;

    if (firebaseUser != null) {
      await firebaseUser.reload();

      User currentUser = FirebaseAuth.instance.currentUser!;
      authNotifier.setUser(currentUser);
    }
  }
}

signout(AuthNotifier authNotifier) async {
  await FirebaseAuth.instance
      .signOut()
      // ignore: avoid_print
      .catchError((error) => print(error.code));

  authNotifier.setUser;
  const UserLogin();
}

initializeCurrentUser(AuthNotifier? authNotifier) async {
  User? appUser = await FirebaseAuth.instance.currentUser;

  print(appUser);
  authNotifier!.setUser(appUser!);
}
