// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startup_space/components/api/user/user_api.dart';
import 'package:startup_space/components/models/consumer/user_model.dart';
import 'package:startup_space/components/navigation.dart';
import 'package:startup_space/components/notifier/user/auth_notifier.dart';
import 'package:startup_space/pages/individuals/register.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // ignore: prefer_final_fields
  UserModel _user = UserModel();

  @override
  void initState() {
    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);
    initializeCurrentUser(authNotifier);
    super.initState();
  }

  void _submitLoginForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();

    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);

    signIn(_user, authNotifier);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Navigation(),
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
                color: Colors.lightBlueAccent,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(32, 96, 32, 0),
                  child: Column(
                    children: [
                      userEmail(),
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

  Widget userEmail() {
    return TextFormField(
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        filled: true,
        fillColor: Colors.lightBlueAccent,
        hintText: 'Email',
        suffixIcon: Icon(Icons.email, color: Colors.white),

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
        _user.email = value;
      },
    );
  }

  Widget password() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        filled: true,
        fillColor: Colors.lightBlueAccent,
        hintText: 'Password',
        suffixIcon: Icon(Icons.lock_outline, color: Colors.white),

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
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const UserRegistration()));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              'Register',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
    );
  }
}
