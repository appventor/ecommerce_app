import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

import 'auth_service.dart';
import 'data_storage.dart';
export 'auth_service.dart';
export 'data_storage.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<DataStorage>(DataStorage());
  locator.registerSingletonAsync<AuthenticationService>(() async {
    return Firebase.initializeApp().then((value) => AuthenticationService());
  });
}
