import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:startup_space/components/navigation.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                user!.photoURL.toString(),
              ),
            ),
            Text(user.displayName.toString()),
            Text(user.email.toString()),
            Text(user.emailVerified.toString()),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Navigation()),
                  );
                },
                child: Text("Proceed")),
          ],
        ),
      ),
    );
  }
}
