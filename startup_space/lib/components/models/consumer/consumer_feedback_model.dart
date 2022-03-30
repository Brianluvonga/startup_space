class ConsumerFeedbackModel {
  String? username;
  String? comment;
  bool? approved;
  bool? disapproved;
  String? time;

  ConsumerFeedbackModel();

  ConsumerFeedbackModel.fromMap(Map<String, dynamic> feedback) {
    username = feedback['username'];
    comment = feedback['comment'];
    approved = feedback['approved'];
    disapproved = feedback['disapproved'];
    time = feedback['time'];
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'comment': comment,
      'approved': approved,
      'disapproved': disapproved,
      'time': time,
    };
  }
}
