import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:startup_space/pages/individuals/google_provider/google_provider.dart';
import 'package:startup_space/pages/individuals/google_sign.dart';
import 'package:startup_space/pages/individuals/profile/profile.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const <Widget>[],
        centerTitle: true,
        backgroundColor: Colors.lightBlue[500],
        title: const Text("Profile"
            // authNotifier.user.displayName.toString(),
            ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            // CircleAvatar(
            //   radius: 40,
            //   backgroundImage: NetworkImage(
            //     user!.photoURL.toString(),
            //   ),
            // ),

            const Divider(),
            // SizedBox(height: 50),
            TextButton(
              onPressed: () {
                final pathProvider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                pathProvider.logUserOut();
              },
              child: const Text("Logout"),
            ),
            const Divider(),

            ListTile(
              contentPadding: const EdgeInsets.all(20),
              title: const Text(
                "Our Space",
                style: TextStyle(
                    fontFamily: 'times',
                    fontWeight: FontWeight.w600,
                    fontSize: 22),
                textAlign: TextAlign.center,
              ),
              onTap: () {},
            )
          ],
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.blue[400],
              ),
            );
          } else if (snapshot.hasData) {
            return const UserProfile();
          } else if (snapshot.hasError) {
            return const Center(child: Text("Error Loggin In"));
          }
          return const GoogleSign();
        },
      ),
    );
  }
}
