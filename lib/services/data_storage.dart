import 'package:shared_preferences/shared_preferences.dart';

class DataStorage {
  DataStorage() {
    initialize();
  }
  SharedPreferences prefs;

  void initialize() async {
    prefs = await SharedPreferences.getInstance();
  }

  String getUserData() {
    String profileData = prefs.getString('user');
    return profileData;
  }

  void storeUserData(String data) {
    prefs.setString('user', data ?? null);
  }
}
