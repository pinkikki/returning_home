import 'package:firebase_auth/firebase_auth.dart';
import 'package:returning_home/frameworks/auth.dart';

class FirebaseEmailAndPasswordAuth implements Auth {
  @override
  Future<AuthState> signIn(String userId, String password) async {
    AuthState authState;
    try {
      final result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: userId, password: password);
      authState = AuthState(
          isAuthenticated: true,
          credential: Credential(
            refreshToken: result.user.refreshToken,
            idToken: await result.user.getIdToken(),
          ),
          account: Account(
            uid: result.user.uid,
            userId: result.user.email,
          ));
    } on FirebaseAuthException catch (e) {
      throw AuthException('Failed to authenticate.', e);
    }

    return authState;
  }
}
