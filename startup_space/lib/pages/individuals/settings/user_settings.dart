import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startup_space/components/notifier/user/auth_notifier.dart';

class UserSettingsPage extends StatefulWidget {
  const UserSettingsPage({Key? key}) : super(key: key);

  @override
  _UserSettingsPageState createState() => _UserSettingsPageState();
}

class _UserSettingsPageState extends State<UserSettingsPage> {
  // settings widget cards

  Widget userName() {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);

    return Card(
      color: Colors.blue[100],
      child: Container(
          height: 120,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text(
                      "User Name",
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Text(
                      authNotifier.user!.displayName.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Color(0xff2a0404), fontSize: 15),
                    ),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) =>

                      //   ),
                      // )
                    },
                  )
                ],
              ),
            ),
          )),
      elevation: 8.0,
      shadowColor: Colors.black,
    );
  }

  Widget userEmail() {
    return Card(
      color: Colors.blue[100],
      child: Container(
          height: 120,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height * 0.16,
            child: Center(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.email_rounded),
                    title: const Text(
                      "Email",
                      textAlign: TextAlign.center,
                    ),
                    subtitle: const Text(
                      'Email',
                      // fetch from database
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xff2a0404), fontSize: 12),
                    ),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) =>

                      //   ),
                      // )
                    },
                  )
                ],
              ),
            ),
          )),
      elevation: 8.0,
      shadowColor: Colors.black,
    );
  }

  Widget startupLocation() {
    return Card(
      color: Colors.blue[100],
      child: Container(
          height: 120,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height * 0.16,
            child: Center(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.location_on_outlined),
                    title: const Text(
                      "Location",
                      textAlign: TextAlign.center,
                    ),
                    subtitle: const Text(
                      'Location',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xff2a0404), fontSize: 12),
                    ),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) =>

                      //   ),
                      // )
                    },
                  )
                ],
              ),
            ),
          )),
      elevation: 8.0,
      shadowColor: Colors.black,
    );
  }

  Widget startupGallery() {
    return Card(
      color: Colors.blue[100],
      child: Container(
          height: 120,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height * 0.16,
            child: Center(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.photo_library_sharp),
                    title: const Text(
                      "Gallery",
                      textAlign: TextAlign.center,
                    ),
                    subtitle: const Text(
                      'Name',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xff2a0404), fontSize: 12),
                    ),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) =>

                      //   ),
                      // )
                    },
                  )
                ],
              ),
            ),
          )),
      elevation: 8.0,
      shadowColor: Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.loose,
        children: <Widget>[
          Positioned(
            left: 10,
            top: 330,
            right: 2,
            child: Column(
              children: <Widget>[
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(children: <Widget>[
                        startupLocation(),
                        startupGallery()
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 10,
            top: 30,
            right: 2,
            child: Column(
              children: <Widget>[
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(children: <Widget>[
                        userName(),
                        userEmail(),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 10,
            top: 180,
            right: 2,
            child: Column(
              children: <Widget>[
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(children: <Widget>[
                        startupLocation(),
                        startupGallery()
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
