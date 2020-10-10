class AuthState {
  AuthState({
    this.isAuthenticated,
    this.credential,
    this.account,
  });

  bool isAuthenticated;
  Credential credential;
  Account account;
}

class Credential {
  Credential({
    this.refreshToken,
    this.expiresIn,
    this.idToken,
    this.accessToken,
  });

  String refreshToken;
  DateTime expiresIn;
  String idToken;
  String accessToken;
}

class Account {
  Account({
    this.uid,
    this.userId,
  });

  String uid;
  String userId;
}

abstract class Auth {
  Future<AuthState> signIn(String userId, String password);
}

class AuthException implements Exception {
  AuthException(this.message, this.cause);

  final String message;
  final Exception cause;
}
