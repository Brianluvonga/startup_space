import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startup_space/pages/individuals/google_provider/google_provider.dart';
import 'package:startup_space/pages/individuals/google_sign.dart';
import 'package:startup_space/pages/startup/account/login_startup.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 150),
              Center(
                child: TextButton(
                  style: TextButton.styleFrom(
                      elevation: 8.0,
                      primary: Colors.white,
                      padding: EdgeInsets.all(15),
                      backgroundColor: Colors.pink),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return const GoogleSign();
                        },
                      ),
                    );
                  },
                  child: const Text('Sign In As User'),
                ),
              ),
              SizedBox(height: 50),
              Center(
                child: TextButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.all(15),
                      elevation: 8.0,
                      primary: Colors.white,
                      // minimumSize: const Size(double.maxFinite, 50),
                      backgroundColor: Colors.pink),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return const StartupLogin();
                        },
                      ),
                    );
                  },
                  child: const Text('Sign In As Startup'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
