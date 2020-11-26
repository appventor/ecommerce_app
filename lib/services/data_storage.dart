import 'package:get_storage/get_storage.dart';

class DataStorage {
  final store = GetStorage();

  String getUserData() {
    String profileData = store.read("user");
    return profileData ?? 'nil';
  }

  void storeUserData(String data) {
    store.write("user", data ?? 'nil');
  }
}
