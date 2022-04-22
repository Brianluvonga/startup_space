import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:startup_space/pages/individuals/google_provider/google_provider.dart';

class GoogleSign extends StatelessWidget {
  const GoogleSign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     title: const Text(""),
      //     centerTitle: true,
      //     backgroundColor: Colors.blueAccent[200]),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              const SizedBox(
                height: 250,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  elevation: 5.0,
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  minimumSize: const Size(double.maxFinite, 50),
                ),
                onPressed: () {
                  final pathProvider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  pathProvider.googleSignIn();
                },
                icon: const FaIcon(FontAwesomeIcons.google, color: Colors.red),
                label: const Text("Sign In With Google"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
