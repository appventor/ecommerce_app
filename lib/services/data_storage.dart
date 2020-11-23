import 'package:get_storage/get_storage.dart';

class DataStorage {
  DataStorage() {
    initialize();
  }
  final store = GetStorage();

  void initialize() async {
    print("data storage init");
    GetStorage.init();
  }

  Future<String> getUserData() async {
    String profileData = store.read('user');
    return profileData ?? 'nil';
  }

  void storeUserData(String data) {
    store.write('user', data ?? 'nil');
  }
}
