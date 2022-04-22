// integrating notifications with firebase based on time and notification read criteria

import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Icon(Icons.notifications, color: Colors.pink),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
    );
  }
}
