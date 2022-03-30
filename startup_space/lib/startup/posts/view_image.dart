import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startup_space/startup/posts/post_notifier/post_notifier.dart';

class ViewImage extends StatelessWidget {
  const ViewImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StartupPostNotifier postNotifier =
        Provider.of<StartupPostNotifier>(context);

    return Image.network(
        postNotifier.currentPost.postImages != null
            ? postNotifier.currentPost.postImages!.toString()
            : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
        width: 100,
        height: 100,
        fit: BoxFit.fitWidth);
  }
}
