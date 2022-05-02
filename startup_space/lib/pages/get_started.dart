import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:startup_space/components/feed/startup_feed.dart';
import 'package:startup_space/components/navigation.dart';
import 'package:startup_space/components/transition.dart';
import 'package:startup_space/pages/individuals/google_provider/google_provider.dart';

import 'package:startup_space/pages/individuals/google_sign.dart';
import 'package:startup_space/pages/individuals/profile/profile.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  Widget registerAsBusiness() {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.white,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10),
        minWidth: 300,
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
          // _saveAsset();
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (BuildContext context) {
          //       return AssetFeed();
          //     },
          //   ),
          // );
        },
        child: const Text(
          'As Business',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }

  Widget registerAsConsumer() {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.white,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10),
        minWidth: 300,
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
          // _saveAsset();
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (BuildContext context) {
          //       return AssetFeed();
          //     },
          //   ),
          // );
        },
        child: const Text(
          'As Consumer',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }

  Widget getStartedImage() {
    User? user = FirebaseAuth.instance.currentUser;

    return Column(
      children: [
        SizedBox(height: 45),
        CircleAvatar(
          radius: 30,
          // backgroundImage: NetworkImage(
          //   // user!.photoURL.toString(),
          // ),
        ),
        Text(user!.displayName.toString()),
        Text(user.email.toString()),
        Text(user.emailVerified.toString()),
      ],
    );
  }

  Widget startButton() {
    return Bounce(
        duration: const Duration(milliseconds: 300),
        onPressed: () {},
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
          child: MaterialButton(
              padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10),
              minWidth: 100,
              onPressed: () {
                FocusScope.of(context).requestFocus(FocusNode());
                // _saveAsset();
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (BuildContext context) {
                //       return AssetFeed();
                //     },
                //   ),
                // );
              },
              child: const Icon(Icons.arrow_forward_ios)),
        ));
  }

  final bool _isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      // drawer: Drawer(context),
      backgroundColor: Colors.blue[300],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // title: const Text(
        //   'Startup Space',
        //   style: TextStyle(color: Colors.pink),
        // ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.account_circle, color: Colors.black),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ],
      ),

      drawer: Drawer(
        child: SizedBox(
          child: Column(
            children: [
              getStartedImage(),
              Divider(
                color: Colors.grey,
              ),
              ListTile(
                leading: Icon(
                  Icons.account_circle,
                  size: 30.0,
                ),
                title: Text('Profile'),
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (BuildContext context) {
                  //       return Profile();
                  //     },
                  //   ),
                  // );
                },
              ),
              Divider(
                color: Colors.grey,
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  size: 30.0,
                ),
                title: Text('Setting'),
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (BuildContext context) {
                  //       return Profile();
                  //     },
                  //   ),
                  // );
                },
              ),
              Divider(
                color: Colors.grey,
              ),
              ListTile(
                leading: Icon(
                  Icons.help,
                  size: 30.0,
                ),
                title: Text('Help'),
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (BuildContext context) {
                  //       return Profile();
                  //     },
                  //   ),
                  // );
                },
              ),
              Divider(
                color: Colors.grey,
              ),
              ListTile(
                leading: Icon(
                  Icons.info_outline_rounded,
                  size: 30.0,
                ),
                title: Text('About'),
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (BuildContext context) {
                  //       return Profile();
                  //     },
                  //   ),
                  // );
                },
              ),
              Divider(
                color: Colors.grey,
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  size: 30.0,
                ),
                title: Text('Logout'),
                onTap: () {
                  final pathProvider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  pathProvider.logUserOut();
                },
              ),
            ],
          ),
        ),
      ),

      body: Center(
        child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.blue[400],
                ),
              );
            } else if (snapshot.hasData) {
              return const PageTransition();
            } else if (snapshot.hasError) {
              return const Center(child: Text("Error Login In"));
            }
            return const GoogleSign();
          },
        ),
      ),
    );
  }
}
