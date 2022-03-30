// discussions model

class Discussions {
  bool? likes;
  bool? dislikes;
  String? username;

  Discussions();

  Discussions.fromMap(Map<String, dynamic> discuss) {
    likes = discuss['likes'];
    dislikes = discuss['dislikes'];
    username = discuss['username'];
  }

  Map<String, dynamic> toMap() {
    return {
      'likes': likes,
      'dislikes': dislikes,
      'username': username,
    };
  }
}
