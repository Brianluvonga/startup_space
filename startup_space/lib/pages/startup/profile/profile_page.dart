import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: Drawer(child: profileSection()),
        body: Stack());
  }

  Widget profileSection() {
    return Stack(
      children: [
        ListView(
          children: const [
            SizedBox(height: 10),
            CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(
                'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
              ),
            ),
          ],
        ),
        Positioned(
          left: 80,
          top: 130,
          child: Column(
            children: <Widget>[
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      children: <Widget>[startupName()],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 20,
          top: 200,
          child: Column(
            children: <Widget>[
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      children: <Widget>[profile()],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget startupName() {
    return Center(
      child: Row(
        children: const [
          Text("Email"),
          SizedBox(width: 30),
          Text("Phone No"),
          SizedBox(width: 30),
          Text("About"),
        ],
      ),
    );
  }

  Widget profile() {
    return const InkWell(
      child: Text("Profile"),
    );
  }
}
