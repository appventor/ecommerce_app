import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

enum AuthStatus { signedIn, signedOut, failed, codeSent, timedOut }

class AuthenticationService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  AuthStatus authStatus = AuthStatus.signedOut;

  String _verificationId;

  Future<AuthStatus> registerUser(String mobile) async {
    auth.verifyPhoneNumber(
        phoneNumber: mobile,
        // timeout: Duration(minutes: 1),
        verificationCompleted: (PhoneAuthCredential credential) async {
          print(credential.smsCode);
          await auth.signInWithCredential(credential);
          return AuthStatus.signedIn;
        },
        verificationFailed: (authException) {
          print(" ${authException.code}: ${authException.message}");
          return AuthStatus.failed;
        },
        codeSent: (String verificationId, [int forceResendingToken]) {
          print("code sent :$verificationId");
          _verificationId = verificationId;
          return AuthStatus.codeSent;
        },
        timeout: Duration(seconds: 120),
        codeAutoRetrievalTimeout: (String verificationId) {
          print("code autoretreival :$verificationId");
          return AuthStatus.timedOut;
        });
  }

  Future<AuthStatus> verifyCode({String code}) {
    var creds = PhoneAuthProvider.credential(
        verificationId: _verificationId, smsCode: code);
    return auth.signInWithCredential(creds).then((userCreds) {
      if (userCreds.user != null)
        return AuthStatus.signedIn;
      else
        return AuthStatus.failed;
    }).catchError((onError) => AuthStatus.failed);
  }

  Future logout() async {
    await auth.signOut().then((_) => authStatus = AuthStatus.signedOut);
  }

  guestLogin() {
    auth
        .signInAnonymously()
        .then((credential) => authStatus = AuthStatus.signedIn);
  }

  Future<String> isUserLoggedIn() async {
    return auth.currentUser.uid;
  }
}
