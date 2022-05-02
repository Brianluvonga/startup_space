// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:startup_space/components/models/startup/startup_registration_model.dart';

import 'package:startup_space/pages/startup/account/api/startup_api.dart';
import 'package:startup_space/pages/startup/account/notifier/startup_auth_notifier.dart';
import 'package:startup_space/pages/startup/account/register_startup.dart';
import 'package:startup_space/pages/startup/profile/startup_details.dart';
import 'package:startup_space/startup/startup_posts.dart';

class StartupLogin extends StatefulWidget {
  const StartupLogin({Key? key}) : super(key: key);

  @override
  _StartupLoginState createState() => _StartupLoginState();
}

class _StartupLoginState extends State<StartupLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // ignore: prefer_final_fields
  StartupRegistrationModel _user = StartupRegistrationModel();

  @override
  void initState() {
    StartupAuthNotifier authNotifier =
        Provider.of<StartupAuthNotifier>(context, listen: false);
    initializeCurrentStartup(authNotifier);
    super.initState();
  }

  void _submitLoginForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();

    StartupAuthNotifier authNotifier =
        Provider.of<StartupAuthNotifier>(context, listen: false);

    signInStartup(_user, authNotifier);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PostsByStartups(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          // ignore: deprecated_member_use
          autovalidate: true,
          key: _formKey,
          child: SingleChildScrollView(
            child: SizedBox(
              width: 350,
              height: 420,
              child: Card(
                shadowColor: Colors.blue,
                elevation: 8.0,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(32, 96, 32, 0),
                  child: Column(
                    children: [
                      startupEmail(),
                      const SizedBox(height: 10),
                      password(),
                      const SizedBox(height: 30),
                      Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.white,
                        child: MaterialButton(
                          padding:
                              const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10),
                          minWidth: 200,
                          onPressed: () => _submitLoginForm()
                          // const UserDetails();
                          ,
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                      ),
                      notAccomplished()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget startupEmail() {
    return TextFormField(
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        filled: true,
        fillColor: Colors.white,
        hintText: 'Startup Email',
        suffixIcon: Icon(Icons.email, color: Colors.black),

        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        labelStyle: TextStyle(color: Colors.black),
      ),
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(
          fontSize: 16, color: Colors.black, fontFamily: 'times'),
      cursorColor: Colors.white,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Email is required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email address';
        }

        return null;
      },
      onSaved: (String? value) {
        _user.emailAddress = value;
      },
    );
  }

  Widget password() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        filled: true,
        fillColor: Colors.white,
        hintText: 'Password',
        suffixIcon: Icon(Icons.lock_outline, color: Colors.black),

        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        labelStyle: TextStyle(color: Colors.black),
      ),
      keyboardType: TextInputType.name,
      style: const TextStyle(
          fontSize: 16, color: Colors.black, fontFamily: 'times'),
      cursorColor: Colors.white,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Password is required';
        }

        if (value.length < 5 || value.length > 20) {
          return 'Password must be betweem 5 and 20 characters';
        }

        return null;
      },
      onSaved: (String? value) {
        _user.password = value;
      },
    );
  }

  Widget notAccomplished() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const RegisterStartup(),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Don\'t have an account ?',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              'Register',
              style: TextStyle(
                  color: Colors.pink[400],
                  fontSize: 15,
                  fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
    );
  }
}
