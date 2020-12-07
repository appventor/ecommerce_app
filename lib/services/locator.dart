export 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

import 'auth_service.dart';
// import 'firestore_service.dart';
import 'data_storage.dart';

export 'auth_service.dart';
export 'firestore_service.dart';
export 'data_storage.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<DataStorage>(DataStorage());
  locator.registerSingleton<AuthenticationService>(AuthenticationService());
  // locator.registerSingleton<FirestoreService>(FirestoreService());
}
