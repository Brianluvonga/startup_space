import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // settings widget cards
  Widget startupName() {
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
                    // leading: Icon(Icons.camera_alt_outlined),
                    title: const Text(
                      "StartUp Name",
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

  Widget startupEmail() {
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

  Widget startupAboutDescription() {
    return Card(
      color: Colors.blue[100],
      child: Container(
          height: 120,
          width: 305,
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
                    leading: const Icon(Icons.description_sharp),
                    title: const Text(
                      "About",
                      textAlign: TextAlign.center,
                    ),
                    subtitle: const Text(
                      'About',
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
                    leading: Icon(Icons.location_on_outlined),
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

  Widget startupCategory() {
    return Card(
      color: Colors.blue[100],
      child: Container(
          height: 120,
          width: 300,
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
                    leading: Icon(Icons.category_outlined),
                    title: const Text(
                      "Category",
                      textAlign: TextAlign.center,
                    ),
                    subtitle: const Text(
                      'Category',
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
        backgroundColor: Colors.lightBlueAccent,
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
                        startupName(),
                        startupEmail(),
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
                        startupAboutDescription(),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 10,
            top: 480,
            right: 2,
            child: Column(
              children: <Widget>[
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(children: <Widget>[
                        startupCategory(),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
