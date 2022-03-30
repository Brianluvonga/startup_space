// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startup_space/components/api/user/user_api.dart';
import 'package:startup_space/components/models/consumer/user_model.dart';
import 'package:startup_space/components/notifier/user/auth_notifier.dart';
import 'package:startup_space/pages/individuals/login.dart';

class UserRegistration extends StatefulWidget {
  const UserRegistration({Key? key}) : super(key: key);

  @override
  _UserRegistrationState createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _passwordController = TextEditingController();

  final UserModel? _user = UserModel();
  @override
  void initState() {
    AuthNotifier authReg = Provider.of<AuthNotifier>(context, listen: false);
    initializeCurrentUser(authReg);
    super.initState();
  }

  void _submitRegForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();

    AuthNotifier authNotifier2 =
        Provider.of<AuthNotifier>(context, listen: false);

    signup(_user!, authNotifier2);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserLogin(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'Activate Account',
      //     style: TextStyle(color: Colors.black),
      //   ),
      //   centerTitle: true,
      //   backgroundColor: Colors.white,
      // ),
      body: Center(
        child: Form(
          autovalidate: true,
          key: _formKey,
          child: SingleChildScrollView(
            child: SizedBox(
              width: 350,
              height: 550,
              child: Card(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(32, 96, 32, 0),
                  child: Column(
                    children: [
                      userFullName(),
                      const SizedBox(height: 5),
                      userEmail(),
                      const SizedBox(height: 5),
                      telephone(),
                      const SizedBox(height: 5),
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
                          onPressed: () => _submitRegForm(),
                          child: const Text(
                            'Register',
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

  Widget appLogo() {
    return Card(
      elevation: 8.0,
      shadowColor: Colors.blue,
      child: Center(
        child: Image.asset(
          'assets/startup2.jpg',
        ),
      ),
    );
  }

  Widget userFullName() {
    // ignore: prefer_const_constructors
    return TextFormField(
      decoration: const InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          filled: true,
          fillColor: Colors.lightBlueAccent,
          hintText: 'FullName',
          suffixIcon: Icon(Icons.account_circle_rounded, color: Colors.white),
          hintStyle: TextStyle(color: Colors.white),

          // border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          labelStyle: TextStyle(color: Colors.black)),
      keyboardType: TextInputType.name,
      style: const TextStyle(
          fontSize: 16, color: Colors.black, fontFamily: 'times'),
      cursorColor: Colors.white,
      validator: (String? value) {
        if (value!.isEmpty) {
          return ' Fullname is required';
        }

        if (value.length < 5 || value.length > 20) {
          return 'Fullname must be betweem 5 and 20 characters';
        }

        return null;
      },
      onSaved: (String? value) {
        _user!.displayName = value;
      },
    );
  }

  Widget userEmail() {
    return TextFormField(
      decoration: const InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          filled: true,
          fillColor: Colors.lightBlueAccent,
          hintText: 'Email',
          hintStyle: TextStyle(color: Colors.white),
          suffixIcon: Icon(Icons.email_rounded, color: Colors.white),
          // border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          labelStyle: TextStyle(color: Colors.black)),
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
        _user!.email = value;
      },
    );
  }

  Widget telephone() {
    return TextFormField(
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        filled: true,
        fillColor: Colors.lightBlueAccent,
        hintStyle: TextStyle(color: Colors.white),
        hintText: 'Phone No',
        suffixIcon: Icon(Icons.phone_enabled, color: Colors.white),
        labelStyle: TextStyle(color: Colors.black),
      ),
      keyboardType: TextInputType.phone,
      style: const TextStyle(
          fontSize: 16, color: Colors.black, fontFamily: 'times'),
      cursorColor: Colors.white,
      validator: (String? value) {
        if (value!.isEmpty) {
          return ' Phone No required';
        }

        if (value.length < 5 || value.length > 12) {
          return 'Fullname must be betweem 5 and 12 characters';
        }

        return null;
      },
      onSaved: (String? value) {
        _user!.phoneNumber = value;
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
          hintStyle: TextStyle(color: Colors.white),
          suffixIcon: Icon(Icons.lock_outline, color: Colors.white),
          // focusColor: Colors.black,
          hoverColor: Colors.black,
          // border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          labelStyle: TextStyle(color: Colors.black)),
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
        _user!.password = value;
      },
    );
  }

  Widget notAccomplished() {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const UserLogin()));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              'Login',
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
