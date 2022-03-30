import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:startup_space/components/api/user/user_api.dart';
import 'package:startup_space/components/notifier/user/auth_notifier.dart';
import 'package:startup_space/pages/individuals/settings/user_settings.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    AuthNotifier? authNotifier = Provider.of<AuthNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        actions: const <Widget>[],
        centerTitle: true,
        backgroundColor: Colors.lightBlue[500],
        title: Text(
          authNotifier.user!.displayName.toString(),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.lightBlue),
              title: const Text("Settings"),
              // subtitle: const Text("Services Subscribed to"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserSettingsPage(),
                  ),
                );
              },
            ),

            // const Divider(),
            // ListTile(
            //   leading:
            //       const Icon(Icons.autorenew_outlined, color: Colors.lightBlue),
            //   title: const Text("Happenings"),
            //   subtitle: const Text("Automate,DateTime & Notifications"),
            //   onTap: () {
            //     // Navigator.push(
            //     //   context,
            //     //   MaterialPageRoute(
            //     //     builder: (context) => ProfileFeed(),
            //     //   ),
            //     // );
            //   },
            // ),

            const Divider(),
            // SizedBox(height: 50),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.lightBlue),
              title: const Text("LogOut"),
              onTap: () {
                signout(authNotifier);
              },
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
    );
  }
}
