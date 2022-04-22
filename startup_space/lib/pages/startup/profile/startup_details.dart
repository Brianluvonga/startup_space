//display home section after logging in its here that individual will
//be provided with easy navigation to various components of the application

import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:startup_space/pages/startup/account/notifier/startup_auth_notifier.dart';

class Constants {
  static const String signout = 'LogOut';
  static const String morePayments = 'Integrated Payments';
  static const String settings = 'Settings';
  static const List<String> choices = <String>[settings, signout, morePayments];
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    StartupAuthNotifier authNotifier =
        Provider.of<StartupAuthNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        // actions: <Widget>[
        //   PopupMenuButton<String>(
        //     padding: const EdgeInsets.all(1.0),
        //     onSelected: popUpAction,
        //     itemBuilder: (BuildContext context) {
        //       return Constants.choices.map((String items) {
        //         return PopupMenuItem<String>(
        //           value: items,
        //           child: Text(items),
        //         );
        //       }).toList();
        //     },
        //   )
        // ],
        centerTitle: true,
        backgroundColor: Colors.lightBlue[500],
        title: Text(
          authNotifier.startup!.displayName.toString(),
        ),
      ),
      drawer: Drawer(
        child: ListView(children: [
          ListTile(
            leading: Icon(
              Icons.verified_user,
              color: Colors.lightBlue,
            ),
            title: Text("Profile"),
            subtitle: Text("Username, Email & PhoneNo"),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => ProfileFeed(),
              //   ),
              // );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payments, color: Colors.lightBlue),
            title: Text("Payments"),
            subtitle: Text("Payment Methods for Transactions"),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => PaymentFeed(),
              //   ),
              // );
            },
          ),
          ListTile(
            leading: Icon(Icons.room_service_outlined, color: Colors.lightBlue),
            title: Text("Services"),
            subtitle: Text("Services Subscribed to"),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => ServiceFeed(),
              //   ),
              // );
            },
          ),

          ListTile(
            leading: Icon(Icons.receipt_rounded, color: Colors.lightBlue),
            title: Text("Records "),
            subtitle: Text("Current & Previous Transactions"),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => ProfileFeed(),
              //   ),
              // );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.autorenew_outlined, color: Colors.lightBlue),
            title: Text("AutoPlan"),
            subtitle: Text("Automate,DateTime & Notifications"),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => ProfileFeed(),
              //   ),
              // );
            },
          ),
          Divider(),
          // SizedBox(height: 50),
          ListTile(
            leading: Icon(Icons.help_outline_sharp, color: Colors.lightBlue),
            title: Text("Help"),
            subtitle: Text("About, Terms and Conditions"),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => HelpPage(),
              //   ),
              // );
            },
          ),
          Divider(),
          // SizedBox(height: 50),
          ListTile(
            leading: Icon(Icons.help_outline_sharp, color: Colors.lightBlue),
            title: Text("LogOut"),
            onTap: () {
              // signout(authNotifier);
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.all(20),
            title: Text(
              "AutoPay",
              style: TextStyle(
                  fontFamily: 'times',
                  fontWeight: FontWeight.w600,
                  fontSize: 22),
              textAlign: TextAlign.center,
            ),
            onTap: () {},
          )
        ]),
      ),
      body: Container(
        padding: EdgeInsets.all(2),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                text: 'InProcess Transactions',
                style: TextStyle(
                    fontFamily: 'times',
                    fontSize: 15.0,
                    // fontWeight: FontWeight.bold,
                    color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: '\nDisplay Bills to be paid for this month'
                          '\n show progress for each',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey))
                ],
              ),
            ),
            Divider(),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                text: 'Previous Transactions',
                style: TextStyle(
                    fontFamily: 'times',
                    fontSize: 15.0,
                    // fontWeight: FontWeight.bold,
                    color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: '\n Bills already paid for the last month',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey))
                ],
              ),
            ),
            Divider(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
