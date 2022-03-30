import 'dart:io';
import 'package:path/path.dart' as path;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:startup_space/startup/model/startup_post_model.dart';
import 'package:startup_space/startup/posts/post_notifier/post_notifier.dart';
import 'package:uuid/uuid.dart';
import 'package:firebase_storage/firebase_storage.dart';
// fetch data from api database firebase

//
//

CollectionReference startupPosts =
    FirebaseFirestore.instance.collection('startup_Posts');

getStartupPosts(StartupPostNotifier postNotifier) async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('startup_Posts')
      .orderBy("createdAt", descending: true)
      .get();

  List<StartupPost> _postList = [];

  for (var document in snapshot.docs) {
    StartupPost post =
        StartupPost.fromMap(document.data() as Map<String, dynamic>);
    _postList.add(post);
  }
  postNotifier.postList = _postList;
}

uploadPostWithImage(StartupPost post, bool isUpdating, File localFileImage,
    Function postUploaded) async {
  post.postedAt = Timestamp.now();
  // ignore: unnecessary_null_comparison
  if (localFileImage != null) {
    var imageUpload = path.extension(localFileImage.path);
    print(imageUpload);
    var uuid = const Uuid().v4();

    final Reference imagePosted =
        FirebaseStorage.instance.ref().child('startup_Posts/$uuid$imageUpload');
    await imagePosted.putFile(localFileImage).catchError((onError) {
      print(onError);
      return false;
    });
    String? url = await imagePosted.getDownloadURL();
    // print('Download Url is: $url');
    _uploadPostDetails(post, isUpdating, postUploaded, imgUrl: url);
  } else {
    _uploadPostDetails(post, isUpdating, postUploaded);
  }
}

_uploadPostDetails(StartupPost post, bool isUpdating, Function postUploaded,
    {String? imgUrl}) async {
  if (imgUrl != null) {
    post.postImages = imgUrl;
  }
  if (isUpdating) {
    post.updatedAt = Timestamp.now();

    await startupPosts.doc(post.description).update(post.toMap());
    postUploaded(post);
  } else {
    post.createdAt = Timestamp.now();
    DocumentReference docRef = await startupPosts.add(post.toMap());
    post.postID = docRef.id;
    await docRef.set(post.toMap());
    postUploaded(post);
  }
}

deletePostDetails(StartupPost post, Function postDeleted) async {
  if (post.postImages != null) {
    final Reference imageReference =
        FirebaseStorage.instance.refFromURL(post.postImages.toString());
    // print(imageReference);
    await imageReference.delete();
    // print('Image Deleted');
  }
  await FirebaseFirestore.instance
      .collection('startup_Posts')
      .doc(post.postID)
      .delete();
  postDeleted(post);
}
