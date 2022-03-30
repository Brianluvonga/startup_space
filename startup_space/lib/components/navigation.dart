import 'package:flutter/material.dart';
import 'package:startup_space/builders/startup/consumer_feedback.dart';
import 'package:startup_space/components/feed/startup_feed.dart';
import 'package:startup_space/pages/get_started.dart';
import 'package:startup_space/startup/notifications/notifications.dart';
import 'package:startup_space/startup/startup_posts.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  final List<Widget> _classNavOptions = [
    const GetStarted(),
    const StartupFeed(),
    const PostsByStartups(),
    const Notifications()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final bool _isNotification = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _classNavOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('StartUps'),
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.outbond_outlined),
            title: Text('Startup Posts'),
          ),
          BottomNavigationBarItem(
            icon: Icon(_isNotification
                ? Icons.notifications_none_sharp
                : Icons.notifications_off),
            title: const Text('Notifications'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightBlueAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
