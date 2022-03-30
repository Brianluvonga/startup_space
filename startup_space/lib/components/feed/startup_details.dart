import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startup_space/components/notifier/startup/startup_notifier.dart';

class StartUpDetails extends StatefulWidget {
  const StartUpDetails({Key? key}) : super(key: key);

  @override
  _StartUpDetailsState createState() => _StartUpDetailsState();
}

class _StartUpDetailsState extends State<StartUpDetails> {
  @override
  Widget build(BuildContext context) {
    StartupNotifier startupNotifier = Provider.of<StartupNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(startupNotifier.currentStartup.startupname.toString()),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent[200],
      ),
      // body: SingleChildScrollView(
      //   child: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Stack(children: [addStartUpFeed(), detailsContainerFeed()]),
      //   ),
      // ),

      body: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.loose,
        children: <Widget>[
          Positioned(
            left: 10,
            top: 80,
            right: 2,
            child: Column(
              children: <Widget>[
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(children: <Widget>[detailsContainerFeed()]),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 10,
            top: 30,
            right: 2,
            child: Column(
              children: <Widget>[
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          // addStartUpFeed(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget addStartUpFeed() {
  //   return Center(
  //     child: Card(
  //       // shape: RoundedRectangleBorder(
  //       //   side: const BorderSide(color: Colors.white70, width: 1),
  //       //   borderRadius: BorderRadius.circular(10),
  //       // ),
  //       child: Image.asset(
  //         'assets/startup2.jpg',
  //         width: 120,
  //       ),
  //     ),
  //   );
  // }

  Widget detailsContainerFeed() {
    StartupNotifier startupNotifier = Provider.of<StartupNotifier>(context);

    return SizedBox(
      width: 350,
      height: 200,
      child: Card(
        elevation: 8.0,
        shadowColor: Colors.blue,
        child: Center(
          child: ListTile(
            title: Text(startupNotifier.currentStartup.description.toString()),
            // subtitle: Text(startupNotifier.currentStartup.category.toString()),
            leading:
                Text(startupNotifier.currentStartup.startupname.toString()),
            trailing: Text(startupNotifier.currentStartup.category.toString()),
          ),
        ),
      ),
    );
  }
}
