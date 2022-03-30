import 'package:flutter/material.dart';

class ConsumerFeedback extends StatefulWidget {
  const ConsumerFeedback({Key? key}) : super(key: key);

  @override
  _ConsumerFeedbackState createState() => _ConsumerFeedbackState();
}

class _ConsumerFeedbackState extends State<ConsumerFeedback> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Consumer Feedback',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Row(
            children: [userDetailsCard(), userFeedback(), consumerStatus()],
          ),
        ),
      ),
    );
  }

  Widget userDetailsCard() {
    return const SizedBox(
      width: 100,
      child: Card(
        child: ListTile(title: Icon(Icons.person), subtitle: Text("username")),
      ),
    );
  }

  Widget userFeedback() {
    return const SizedBox(
      width: 250,
      height: 110,
      child: Card(
        child: Center(
          child: Text(
            "Here is my feedback on the said product",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget consumerStatus() {
    return const SizedBox(
      width: 35,
      height: 35,
      child: Card(
        child: Center(
          child: Icon(Icons.thumb_up_off_alt_sharp, color: Colors.green),
        ),
      ),
    );
  }
}
