import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startup_space/startup/posts/post_notifier/post_notifier.dart';

class PostDetails extends StatelessWidget {
  const PostDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StartupPostNotifier postNotifier =
        Provider.of<StartupPostNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Whats Up', style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading:
                      Text(postNotifier.currentPost.aboutPosted.toString()),
                  trailing: Text(
                    postNotifier.currentPost.postedAt!
                        .toDate()
                        .toUtc()
                        .toString(),
                    style: const TextStyle(color: Colors.green),
                  ),
                ),

                Image.network(
                    postNotifier.currentPost.postImages != null
                        ? postNotifier.currentPost.postImages!.toString()
                        : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.fitWidth),
                // likeSection(),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
