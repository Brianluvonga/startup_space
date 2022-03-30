import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:startup_space/components/models/startup/startup_model.dart';

class FirestoreInstance {
  //creating new collection for startup registration
  final CollectionReference _startupReference =
      FirebaseFirestore.instance.collection('StartupReg');

  Future createStartup(StartupModel startup) async {
    try {
      await _startupReference.doc(startup.startupId).set(startup.toMap());
    } catch (error) {
      return error;
    }
  }

  Future fetchStartup(String? sID) async {
    try {
      var startupData = await _startupReference.doc(sID).get();
      return StartupModel.fromMap(startupData.data as Map<String, dynamic>);
    } catch (e) {
      return e;
    }
  }
}
