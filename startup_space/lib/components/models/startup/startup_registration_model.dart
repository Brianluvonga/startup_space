import 'package:cloud_firestore/cloud_firestore.dart';

class StartupRegistrationModel {
  String? id;
  String? name;
  String? emailAddress;
  String? password;
  Timestamp? createdAt;

  StartupRegistrationModel();
}
