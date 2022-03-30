import 'package:cloud_firestore/cloud_firestore.dart';

class StartupModel {
  String? startupId;
  String? startupname;
  String? imageFile;
  String? email;
  String? description;
  String? location;
  String? category;
  String? password;
  Timestamp? createdAt;
  Timestamp? updatedAt;

// constructor
  StartupModel(
      {this.startupId,
      this.startupname,
      this.imageFile,
      this.email,
      this.description,
      this.location,
      this.category,
      this.password});

  StartupModel.fromMap(Map<String, dynamic> startup) {
    startupId = startup['startupId'];
    startupname = startup['startupname'];
    email = startup['email'];
    description = startup['description'];
    location = startup['location'];
    category = startup['category'];
    createdAt = startup['createdAt'];
    updatedAt = startup['updatedAt'];
  }
  Map<String, dynamic> toMap() {
    return {
      'startupId': startupId,
      'startupname': startupname,
      'email': email,
      'description': description,
      'location': location,
      'category': category,
      'createdAt': createdAt!.toDate(),
      'updatedAt': updatedAt
    };
  }
}
