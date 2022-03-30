import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:startup_space/components/models/startup/startup_model.dart';

class StartupPost extends StartupModel {
  String? postID;
  late String? startupID;
  Timestamp? postedAt;
  int? likesCount;
  int? dislikes;
  List<String>? likeList;
  // List comments;
  int? commentsCount;
  String? postImages;
  String? aboutPosted;

  StartupPost();

  StartupPost.fromMap(Map<String, dynamic> posts) {
    postID = posts['postID'];
    postedAt = posts['postedAt'];
    likesCount = posts['likeCount'] ?? 0;
    commentsCount = posts['commentsCount'];
    dislikes = posts['dislikes'];
    // comments = posts['comments'];
    postImages = posts['postImages'];
    aboutPosted = posts['aboutPosted'];

//count likes for each post
    if (posts["likeList"] != null) {
      likeList = <String>[];
      final list = posts["likeList"];
      //
      //
//likeList stored as a string
      if (list is List) {
        posts["likeList"].forEach((value) {
          if (value is String) {
            likeList!.add(value);
          }
        });
        likesCount = likeList!.length;
      } else if (list is Map) {
        list.forEach((key, value) {
          likeList!.add(value['startupID']);
        });
        likesCount = list.length;
      }
    } else {
      likeList = [];
      likesCount = 0;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'postID': postID,
      'postedAt': postedAt,
      'likesCount': likesCount,
      'dislikes': dislikes,
      // 'comments': comments,
      'postImages': postImages,
      'aboutPosted': aboutPosted,
    };
  }
}
