import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_demo3x4/models/user_model.dart';

// This service handles user authentication using Firebase Authentication.
class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  UserModel? _currentUser;
  UserModel? get currentUser => _currentUser;

  Future<bool> isUserLoggedIn() async {
    var user = _firebaseAuth.currentUser;
    if (user != null) {
      _currentUser = UserModel.fromFirebase(user);
      return true;
    }
    return false;
  }

  Future<UserModel?> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      var result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (result.user != null) {
        _currentUser = UserModel.fromFirebase(result.user!);
        return _currentUser;
      }
      return null;
    } on FirebaseAuthException catch (e) {
      throw AuthenticationException(message: getErrorMessage(e.code));
    }
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
    _currentUser = null;
  }

  String getErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'user-disabled':
        return 'This user has been disabled.';
      case 'user-not-found':
        return 'No user found with this email.';
      case 'wrong-password':
        return 'The password is invalid for this email.';
      case 'invalid-credential':
        return 'The credentials are invalid or malformed.';
      default:
        return 'An unknown error occurred. Please try again.';
    }
  }
}

class AuthenticationException implements Exception {
  final String message;
  AuthenticationException({required this.message});
}
