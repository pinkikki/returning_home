import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authProvider = Provider((ref) => Auth());

class Auth {
  Auth({
    this.isAuth = false,
    this.credential,
  });

  bool isAuth;
  UserCredential credential;
}
