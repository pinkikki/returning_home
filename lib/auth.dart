import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  Auth({
    this.isAuth = false,
    this.credential,
  });

  bool isAuth;
  UserCredential credential;
}
