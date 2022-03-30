// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:startup_space/components/models/startup/startup_model.dart';
// import 'package:startup_space/components/models/startup/startup_registration.dart';
// import 'package:startup_space/components/notifier/startup/startup_notifier.dart';

// // connect to firebase create collection and query collection
// uploadStartup(StartupRegistrationModel startup, bool isUploading, onStartupUploaded) async {
//   _uploadStartup(startup, isUploading, onStartupUploaded);
// }

// CollectionReference startupReference =
//     FirebaseFirestore.instance.collection('Startups');

// getStartups(StartupNotifier startupNotifier) async {
//   QuerySnapshot snapshot = await FirebaseFirestore.instance
//       .collection('StartupReg')
//       .orderBy("createdAt", descending: true)
//       .get();

//   List<StartupModel> _startupList = [];

//   for (var document in snapshot.docs) {
//     StartupModel startup =
//         StartupModel.fromMap(document.data() as Map<String, dynamic>);
//     _startupList.add(startup);
//   }

//   startupNotifier.startupList = _startupList;
// }

// _uploadStartup(
//     StartupRegistrationModel startup, bool isUpdating, Function assetUploaded) async {
//   if (isUpdating) {
//     startup.updatedAt = Timestamp.now();
//     await startupReference.doc(startup.startupname).update(startup.toMap());
//     assetUploaded(startup);
//   } else {
//     FirebaseFirestore.instance
//         .collection('Startups')
//         .where('name', isEqualTo: startup.startupname)
//         .get()
//         .then(
//       (value) async {
//         if (value.docs.isNotEmpty) {
//           return "Startup Already Exists";
//         } else {
//           startup.createdAt = Timestamp.now();
//           DocumentReference docRef =
//               await startupReference.add(startup.toMap());
//           startup.startupId = docRef.id;
//           await docRef.set(startup.toMap());
//           assetUploaded(startup);
//         }
//       },
//     );
//   }
// }

// deleteAsset(StartupModel startup, Function startupDeleted) async {
//   await FirebaseFirestore.instance
//       .collection('Startups')
//       .doc(startup.startupname)
//       .delete();
//   startupDeleted(startup);
// }
