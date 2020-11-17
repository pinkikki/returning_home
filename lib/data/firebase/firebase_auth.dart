import 'package:firebase_auth/firebase_auth.dart';
import 'package:returning_home/frameworks/auth.dart';

class FirebaseEmailAndPasswordAuth implements Auth {
  @override
  Future<AuthState> signIn(String userId, String password) async {
    AuthState authState;
    try {
      final result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: userId, password: password);
      authState = await _createAuthState(result.user);
    } on FirebaseAuthException catch (e) {
      throw AuthException('Failed to sign in with email and password.', e);
    }

    return authState;
  }

  @override
  bool isAuthenticated() {
    return FirebaseAuth.instance.currentUser != null;
  }

  @override
  Future<AuthState> getAuthState() async {
    return _createAuthState(FirebaseAuth.instance.currentUser);
  }

  Future<AuthState> _createAuthState(User user) async {
    return AuthState(
      isAuthenticated: true,
      credential: Credential(
        refreshToken: user.refreshToken,
        idToken: await user.getIdToken(),
      ),
      account: Account(
        uid: user.uid,
        userId: user.email,
      ),
    );
  }
}
