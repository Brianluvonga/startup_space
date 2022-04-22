import 'package:cloud_firestore/cloud_firestore.dart';

class StartupRegistrationModel {
  String? id;
  String? name;
  String? emailAddress;
  String? password;
  Timestamp? createdAt;

  StartupRegistrationModel();
  // constructor
  StartupRegistrationModel.fromMap(Map<String, dynamic> startup) {
    id = startup['id'];
    name = startup['name'];
    emailAddress = startup['emailAddress'];
    password = startup['password'];
    createdAt = startup['createdAt'];
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'emailAddress': emailAddress,
      'password': password,
      'createdAt': createdAt!.toDate(),
    };
  }
}
