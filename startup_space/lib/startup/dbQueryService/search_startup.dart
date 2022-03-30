import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:startup_space/startup/model/startup_post_model.dart';

//
//

//reference section
final searchReference = FirebaseFirestore.instance.collection('Startups');
//narrowed to search to type of startup

Future<QuerySnapshot> searchStartup(String? search) async {
  Future<QuerySnapshot> searchQuery = searchReference
      .where('category', isGreaterThanOrEqualTo: search)
      .where('category', isLessThan: search! + 'z')
      .get();

  return searchQuery;
}

final postReference = FirebaseFirestore.instance.collection('startup_Posts');

final postReferenceFeed = FirebaseFirestore.instance.collection('feeds');
final likesReference = FirebaseFirestore.instance.collection('likes');

void likePost(String? currentPostId, StartupPost post) {
  DocumentReference postDocumentProfile = postReference
      .doc(post.startupId)
      .collection('startup_Posts')
      .doc(post.postID);
  postDocumentProfile.get().then(
    (doc) {
      int likes = doc['likes'];
      postDocumentProfile.update({'likes': likes + 1});
    },
  );

  DocumentReference postDocumentFeed = postReferenceFeed
      .doc(currentPostId)
      .collection('postFeed')
      .doc(post.postID);
  postDocumentFeed.get().then(
    (value) {
      if (value.exists) {
        int likes = value['likes'];
        postDocumentFeed.update({'likes': likes + 1});
      }
    },
  );
  likesReference
      .doc(post.postID)
      .collection('postLikes')
      .doc(currentPostId)
      .set({});
}

void dislikePost(String? startupId, StartupPost post) {
  DocumentReference postDocProfile = postReference
      .doc(post.startupId)
      .collection('startupPosts')
      .doc(post.postID);
  postDocProfile.get().then((doc) {
    int likes = doc['likes'];
    postDocProfile.update({'likes': likes - 1});
  });

  DocumentReference postDocFeed = postReferenceFeed
      .doc(startupId)
      .collection('startupFeed')
      .doc(post.postID);
  postDocFeed.get().then(
    (doc) {
      if (doc.exists) {
        int likes = doc['likes'];
        postDocFeed.update({'likes': likes - 1});
      }
    },
  );

  likesReference
      .doc(post.postID)
      .collection('postLikes')
      .doc(startupId)
      .get()
      .then(
        (doc) => doc.reference.delete(),
      );
}

Future<bool> isLikePost(String startupId, StartupPost post) async {
  DocumentSnapshot startupDocument = await likesReference
      .doc(post.postID)
      .collection('postLikes')
      .doc(startupId)
      .get();

  return startupDocument.exists;
}
