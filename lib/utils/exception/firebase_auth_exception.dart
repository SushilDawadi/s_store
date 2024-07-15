class CFirebaseAuthException implements Exception {
  final String code;

  CFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'The email is already in use by another account.';
      case 'invalid-email':
        return 'The email is invalid.';
      case 'operation-not-allowed':
        return 'Email & Password accounts are not enabled.';
      case 'weak-password':
        return 'The password is too weak.';
      case 'user-not-found':
        return 'No user found for that email.';
      case 'wrong-password':
        return 'Wrong password provided for that user.';
      case 'user-disabled':
        return 'The user account has been disabled by an administrator.';
      case 'too-many-requests':
        return 'Too many requests. Try again later.';
      case 'network-request-failed':
        return 'A network error (such as timeout, interrupted connection, or unreachable host) has occurred.';
      case 'requires-recent-login':
        return 'This operation is sensitive and requires recent authentication. Log in again before retrying this request.';
      case 'user-mismatch':
        return 'The supplied credentials do not correspond to the previously signed in user.';
      case 'provider-already-linked':
        return 'This credential is already associated with a different user account.';
      default:
        return 'An error occurred while processing the request.';
    }
  }
}
