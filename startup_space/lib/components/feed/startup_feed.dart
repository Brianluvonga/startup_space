import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startup_space/components/api/startup/startup_api.dart';
import 'package:startup_space/components/feed/startup_details.dart';
import 'package:startup_space/pages/startup/account/notifier/startup_notifier.dart';

class Constants {
  static const String Trending = 'Trending';
//  static const String Settings = 'Settings';
  static const String SignOut = 'Sign out';

  static const String Search = 'Search';

  static const List<String> choices = <String>[Trending, Search, SignOut];
}

class PostConstants {
  static const String Delete = 'Delete';
  static const String About = 'About';

  static const List<String> choices = <String>[Delete, About];
}

class StartupFeed extends StatefulWidget {
  const StartupFeed({Key? key}) : super(key: key);

  @override
  _StartupFeedState createState() => _StartupFeedState();
}

class _StartupFeedState extends State<StartupFeed> {
  String? newStartup = 'new startups';
  loadNewStartups() {}
  @override
  void initState() {
    StartupNotifier startupNotifier =
        Provider.of<StartupNotifier>(context, listen: false);
    // getStartups(startupNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    StartupNotifier startupNotifier = Provider.of<StartupNotifier>(context);

    Future<void> _refreshList() async {
      // getStartups(startupNotifier);
    }

    void choiceAction(String choice) {
      if (choice == Constants.Trending) {
      } else if (choice == Constants.Search) {
      } else if (choice == Constants.SignOut) {}
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Startups',
          style: TextStyle(color: Colors.pink),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return Constants.choices.map(
                (String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                },
              ).toList();
            },
          )
        ],
      ),
      body: RefreshIndicator(
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 160,
              width: 200,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    // right: 10,
                    top: 45,
                    right: 20,
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Row(children: <Widget>[
                                Card(
                                  elevation: 8.0,
                                  // shadowColor: Colors.blue,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: SizedBox(
                                      height: 80,
                                      width: 150,
                                      child: Text(
                                        startupNotifier
                                            .startupList[index].createdAt
                                            .toString(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 10,
                    top: 20,
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: SizedBox(
                                        height: 80,
                                        width: 150,
                                        child: ListTile(
                                          title: Text(
                                              startupNotifier.startupList[index]
                                                  .emailAddress
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 11)),
                                          leading: const CircleAvatar(
                                            radius: 25,
                                            backgroundImage: NetworkImage(
                                              'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                                            ),
                                          ),
                                          onTap: () {
                                            startupNotifier.currentStartup =
                                                startupNotifier
                                                    .startupList[index];
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) {
                                                  return const StartUpDetails();
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 40,
                    top: 120,
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  progressField(),
                                  const SizedBox(width: 30),
                                  uplift()
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 70,
                    top: 5,
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: SizedBox(
                                        height: 80,
                                        width: 150,
                                        child: ListTile(
                                          title: Text(
                                              startupNotifier
                                                  .startupList[index].name
                                                  .toString(),
                                              style: TextStyle(fontSize: 14)),
                                        ),
                                      ),
                                    ),
                                  )
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
          },
          itemCount: startupNotifier.startupList.length,
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              color: Colors.black26,
            );
          },
        ),
        onRefresh: _refreshList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ignore: unnecessary_null_comparison
          startupNotifier.currentStartup == null;
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (BuildContext context) {
          //       return const StartupDetails(
          //         isUploading: false,
          //       );
          //     },
          //   ),
          // );
        },
        child: const Icon(Icons.add_to_photos_rounded),
        foregroundColor: Colors.white,
        backgroundColor: Colors.pink[400],
      ),
    );
  }

  Widget progressField() {
    return Row(
      children: [hearts()],
    );
  }

  Widget hearts() {
    return const Center(
      child: Icon(Icons.favorite_border_sharp),
    );
  }

  Widget uplift() {
    return const Center(
      child: Icon(Icons.arrow_upward_rounded),
    );
  }

  Widget startupName() {
    return Center();
  }
}
