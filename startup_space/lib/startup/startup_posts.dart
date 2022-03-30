import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startup_space/startup/posts/add_posts.dart';
import 'package:startup_space/startup/posts/post_api/post_api.dart';
import 'package:startup_space/startup/posts/post_notifier/post_notifier.dart';
import 'package:startup_space/startup/posts/view_image.dart';

class PostConstants {
  static const String Delete = 'Delete';
  static const String About = 'About';

  static const List<String> choices = <String>[Delete, About];
}

class PostsByStartups extends StatefulWidget {
  const PostsByStartups({
    Key? key,
  }) : super(key: key);

  @override
  _PostsByStartupsState createState() => _PostsByStartupsState();
}

class _PostsByStartupsState extends State<PostsByStartups> {
  @override
  void initState() {
    StartupPostNotifier postNotifier =
        Provider.of<StartupPostNotifier>(context, listen: false);
    getStartupPosts(postNotifier);

    super.initState();
  }

  // ignore: unused_field
  int _likesCount = 0;
  bool _isLiked = false;
  likeTweet() {
    if (_isLiked) {
      // dislikePost(widget.currentStartupId, widget.post);
      setState(() {
        _isLiked = false;
        _likesCount--;
      });
    } else {
      // likePost(widget.currentStartupId, widget.post);
      setState(() {
        _isLiked = true;
        _likesCount++;
      });
    }
  }

  initPostLikes() async {
    // bool isLiked = await isLikePost(widget.currentStartupId, widget.post);
    if (mounted) {
      setState(() {
        // _isLiked = isLiked;
      });
    }
  }

// get number of comments from post
  countComments() {}

  @override
  Widget build(BuildContext context) {
    StartupPostNotifier postNotifier =
        Provider.of<StartupPostNotifier>(context);

    Future<void> _refreshList() async {
      setState(() {
        getStartupPosts(postNotifier);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Startup Posts"),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: RefreshIndicator(
        onRefresh: _refreshList,
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 200,
              width: 160,
              child: Stack(
                children: [
                  Positioned(
                    // right: 10,
                    top: 40,
                    left: 150,
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
                                        child: Text(
                                          postNotifier
                                              .postList[index].aboutPosted
                                              .toString(),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(fontSize: 12),
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
                  Positioned(
                    top: 170,
                    left: 80,
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  actions(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 70,
                    left: 100,
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => const ViewImage(),
                          child: Image.network(
                            postNotifier.postList[index].postImages != null
                                ? postNotifier.postList[index].postImages!
                                    .toString()
                                : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                            width: 100,
                            height: 80,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 10,
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Row(
                                children: <Widget>[profilePic()],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 80,
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Row(
                                children: <Widget>[startupName()],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 160,
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                      postNotifier.postList[index].createdAt!
                                          .toDate()
                                          .toString(),
                                      style: const TextStyle(fontSize: 12))
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
          itemCount: postNotifier.postList.length,
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              color: Colors.white,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ignore: unnecessary_null_comparison
          postNotifier.currentPost == null;
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const StartupPosts(
                  isUpdating: false,
                );
              },
            ),
          );
        },
        child: const Icon(Icons.add_to_photos_rounded),
        foregroundColor: Colors.black,
        backgroundColor: Colors.lightBlueAccent[100],
      ),
    );
  }

  Widget actions() {
    return Row(
      children: [
        favoriteIcon(),
        const SizedBox(
          width: 100,
        ),
        commentIcon(),
        const SizedBox(
          width: 100,
        ),
        shareIcon()
      ],
    );
  }

//action section

  Widget favoriteIcon() {
    return const Center(
      child: Icon(Icons.favorite_border_sharp),
    );
  }

  Widget shareIcon() {
    return const Center(
      child: Icon(Icons.share_outlined),
    );
  }

  Widget commentIcon() {
    return const Center(
      child: Icon(Icons.mode_comment_outlined),
    );
  }

  //profile section details

  Widget profilePic() {
    return const CircleAvatar(
      radius: 30,
      backgroundImage: NetworkImage(
        'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
      ),
    );
  }

  Widget startupName() {
    return const Text("Startup Name", style: TextStyle(fontSize: 12));
  }
}
