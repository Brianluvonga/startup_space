import 'package:get_it/get_it.dart';
import 'package:startup_space/firestore/startup_creation.dart';

GetIt locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton(() => FirestoreInstance());
}
