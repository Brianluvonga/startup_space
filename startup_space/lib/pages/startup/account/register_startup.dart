import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startup_space/components/models/startup/startup_registration_model.dart';
import 'package:startup_space/components/notifier/startup/startup_notifier.dart';
import 'package:startup_space/pages/startup/account/login_startup.dart';

class RegisterStartup extends StatefulWidget {
  final bool isUploading;
  const RegisterStartup({Key? key, required this.isUploading})
      : super(key: key);

  @override
  _RegisterStartupState createState() => _RegisterStartupState();
}

class _RegisterStartupState extends State<RegisterStartup> {
  TextEditingController businessCategoryController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final StartupRegistrationModel _startup = StartupRegistrationModel();

  @override
  void initState() {
    StartupNotifier startupNotifier =
        Provider.of<StartupNotifier>(context, listen: false);
    // getStartups(startupNotifier);
    super.initState();
  }

  // Widget imageSection() {
  //   final image = NetworkImage(_startup.imageFile.toString());

  //   return ClipOval(
  //     child: Material(
  //       child: Ink.image(
  //         image: image,
  //         fit: BoxFit.cover,
  //         width: 128,
  //         height: 128,
  //         // child: InkWell(onTap: onClicked),
  //       ),
  //     ),
  //   );
  // }

  // ignore: non_constant_identifier_names
  Widget business_name() {
    return TextFormField(
      textCapitalization: TextCapitalization.words,
      decoration: const InputDecoration(
          labelText: 'Startup Name',
          fillColor: Colors.white,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          filled: true,
          suffixIcon: Icon(Icons.verified_user_rounded, color: Colors.black),
          labelStyle: TextStyle(color: Colors.black)),
      keyboardType: TextInputType.name,
      style: const TextStyle(
          fontSize: 16, color: Colors.black, fontFamily: 'times'),
      cursorColor: Colors.black,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      onSaved: (String? value) {
        _startup.name = value;
      },
    );
  }

  Widget email() {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: 'Email',
          fillColor: Colors.white,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          filled: true,
          suffixIcon: Icon(Icons.email, color: Colors.black),
          labelStyle: TextStyle(color: Colors.black)),
      keyboardType: TextInputType.name,
      style: const TextStyle(
          fontSize: 16, color: Colors.black, fontFamily: 'times'),
      cursorColor: Colors.black,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      onSaved: (String? value) {
        _startup.emailAddress = value!;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      decoration: const InputDecoration(
          suffixIcon: Icon(Icons.lock_open, color: Colors.black),
          fillColor: Colors.white,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          filled: true,
          labelText: 'Password',
          labelStyle: TextStyle(color: Colors.black)),
      style: const TextStyle(
          fontSize: 16, color: Colors.black, fontFamily: 'times'),
      cursorColor: Colors.black,
      obscureText: true,
      controller: _passwordController,
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
        _startup.password = value;
      },
    );
  }

  Widget _buildConfirmPasswordField() {
    return TextFormField(
      decoration: const InputDecoration(
        suffixIcon: Icon(Icons.lock_open, color: Colors.black),
        fillColor: Colors.white,
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        filled: true,
        labelText: 'Confirm Password',
        labelStyle: TextStyle(color: Colors.black),
      ),
      style: const TextStyle(
          fontSize: 16, color: Colors.black, fontFamily: 'times'),
      cursorColor: Colors.black,
      obscureText: true,
      validator: (String? value) {
        if (_passwordController.text != value) {
          return 'Passwords do not match';
        }

        return null;
      },
    );
  }

  Widget notAccomplished() {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const StartupLogin()));
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
                  color: Colors.lightBlueAccent,
                  fontSize: 15,
                  fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
    );
  }

  // _onStartupUploaded(StartupRegistrationModel? startup) {
  //   StartupNotifier startupNotifier =
  //       Provider.of<StartupNotifier>(context, listen: false);
  //   startupNotifier.addStartup(startup);
  //   Navigator.pop(context);
  // }

  Future<void> saveStartup() async {
    if (!_formKey.currentState!.validate()) {
      return;
    } else {
      _formKey.currentState!.save();
      // uploadStartup(_startup, widget.isUploading, _onStartupUploaded);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Startup Registration"),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent[200],
      ),
      body: Center(
        child: Form(
          // ignore: deprecated_member_use
          autovalidate: true,
          key: _formKey,
          child: SingleChildScrollView(
            child: SizedBox(
              width: 350,
              height: 550,
              child: Card(
                shadowColor: Colors.blue,
                elevation: 8.0,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 20, 32, 0),
                  child: Column(
                    children: [
                      // imageSection(),
                      business_name(),
                      const SizedBox(height: 10),
                      email(),
                      const SizedBox(height: 10),

                      _buildPasswordField(),
                      const SizedBox(height: 10),

                      _buildConfirmPasswordField(),
                      const SizedBox(height: 40),
                      Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.white,
                        child: MaterialButton(
                          padding:
                              const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10),
                          minWidth: 200,
                          onPressed: () => saveStartup(),
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
}
