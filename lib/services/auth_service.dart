import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  String _token;
  String get token => _token;

  Future registerUser(String mobile) async {
    auth.verifyPhoneNumber(
        phoneNumber: mobile,
        timeout: Duration(minutes: 1),
        verificationCompleted: (authCredential) {
          print(authCredential.providerId);
        },
        verificationFailed: (authException) {
          print(" ${authException.code}: ${authException.message}");
        },
        codeSent: (String verificationId, [int forceResendingToken]) {
          print("code sent :$verificationId");
        },
        codeAutoRetrievalTimeout: null);
  }

  Future logout() async {
    await auth.signOut();
  }

  Future guestLogin() async {
    return await auth.signInAnonymously();
  }

  Future<bool> isUserLoggedIn() async {
    var user = auth.authStateChanges();
    // StreamSubscription<User> userStateChanges = user.listen((event) {});
    await _populateCurrentUser(await user.first);
    return user != null;
  }

  Future _populateCurrentUser(User user) async {
    if (user != null) {
      // await _analyticsService.setUserProperties(userId: user.uid);
      _token = await user.getIdToken();
    }
  }
}
