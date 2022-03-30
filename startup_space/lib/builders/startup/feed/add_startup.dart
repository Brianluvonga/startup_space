import 'package:flutter/material.dart';

class AddStartUpFeed extends StatefulWidget {
  const AddStartUpFeed({Key? key}) : super(key: key);

  @override
  _AddStartUpFeedState createState() => _AddStartUpFeedState();
}

class _AddStartUpFeedState extends State<AddStartUpFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: () {
          // Navigator.of(context).push(
          //   MaterialPageRoute(builder: (BuildContext context) {
          //     // return AssetFeed();
          //   }),
          // );
        },
        child: const Icon(Icons.add_to_photos),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue[300],
      ),
    );
  }
}
