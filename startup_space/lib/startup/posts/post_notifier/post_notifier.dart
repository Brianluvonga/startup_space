import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:startup_space/startup/model/startup_post_model.dart';

class StartupPostNotifier with ChangeNotifier {
  List<StartupPost> _postList = [];
  StartupPost _currentPost = StartupPost();

  UnmodifiableListView<StartupPost> get postList =>
      UnmodifiableListView(_postList);

  StartupPost get currentPost => _currentPost;

  set postList(List<StartupPost> postList) {
    _postList = postList;
    notifyListeners();
  }

  set currentPost(StartupPost post) {
    _currentPost = post;
    notifyListeners();
  }

  addPost(StartupPost post) {
    _postList.insert(0, post);
    notifyListeners();
  }

  deletePost(StartupPost post) {
    _postList.removeWhere((_post) => _post.postID == post.postID);
    notifyListeners();
  }
}
