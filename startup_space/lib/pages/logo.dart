import 'package:flutter/material.dart';

class LogoLaunch extends StatelessWidget {
  const LogoLaunch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 400,
      color: Colors.white,
      child: Center(
        child: Image.asset(
          'assets/logo.png',
          width: 200,
        ),
      ),
    );
  }
}
