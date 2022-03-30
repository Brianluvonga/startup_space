import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  Widget registerAsBusiness() {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.white,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10),
        minWidth: 300,
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
          // _saveAsset();
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (BuildContext context) {
          //       return AssetFeed();
          //     },
          //   ),
          // );
        },
        child: const Text(
          'As Business',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }

  Widget registerAsConsumer() {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.white,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10),
        minWidth: 300,
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
          // _saveAsset();
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (BuildContext context) {
          //       return AssetFeed();
          //     },
          //   ),
          // );
        },
        child: const Text(
          'As Consumer',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }

  Widget getStarted() {
    return const Text(
      'Get Started',
      style: TextStyle(fontSize: 30, color: Colors.white),
    );
  }

  Widget getStartedIntroText() {
    return const SizedBox(
        child: Text(
      'Boost Your Startup or Business by being visible to the outside world, let your services and what you do be known to the general public.',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 20, color: Colors.white),
    ));
  }

  Widget getStartedImage() {
    return Center(
      child: Image.asset(
        'assets/startup.png',
        width: 400,
      ),
    );
  }

  Widget startButton() {
    return Bounce(
        duration: const Duration(milliseconds: 300),
        onPressed: () {},
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
          child: MaterialButton(
              padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10),
              minWidth: 100,
              onPressed: () {
                FocusScope.of(context).requestFocus(FocusNode());
                // _saveAsset();
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (BuildContext context) {
                //       return AssetFeed();
                //     },
                //   ),
                // );
              },
              child: const Icon(Icons.arrow_forward_ios)),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      // appBar: AppBar(
      //   title: const Text('StartUp-Space'),
      //   centerTitle: true,
      //   backgroundColor: Colors.blue[300],
      // ),
      body: Center(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            const SizedBox(height: 100),
            getStarted(),
            const SizedBox(height: 100),
            getStartedIntroText(),
            const SizedBox(height: 40),
            getStartedImage(),
            const SizedBox(height: 20),
            startButton(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
