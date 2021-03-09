import 'dart:async';
import 'dart:collection';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:housegroom/home/view/home_page.dart';
import 'package:meta/meta.dart';

import 'models/models.dart';

/// Thrown if during the sign up process if a failure occurs.
class SignUpFailure implements Exception {}

/// Thrown during the login process if a failure occurs.
class LogInWithEmailAndPasswordFailure implements Exception {}

/// Thrown during the sign in with google process if a failure occurs.
class LogInWithGoogleFailure implements Exception {}

/// Thrown during the logout process if a failure occurs.
class LogOutFailure implements Exception {}

class AuthenticationRepository {
  /// Stream of [User] which will emit the current user when
  /// the authentication state changes.
  ///
  /// Emits [User.empty] if the user is not authenticated.
  Stream<User> get user {
    // return _firebaseAuth.authStateChanges().map((firebaseUser) {
    //   return firebaseUser == null ? User.empty : firebaseUser.toUser;
    // });
    Amplify.Hub.listen([HubChannel.Auth], (hubEvent) {
      print(hubEvent.eventName);
    });
  }

  /// Creates a new user with the provided [email] and [password].
  ///
  /// Throws a [SignUpFailure] if an exception occurs.
  Future<void> signUp({
    @required String email,
    @required String password,
  }) async {
    assert(email != null && password != null);
    try {
      Map<String, String> attrib = HashMap();
      var result = await Amplify.Auth.signUp(
          username: email,
          password: password,
          options: CognitoSignUpOptions(userAttributes: attrib));
      print(result.nextStep);
    } catch (e) {
      print(e.message);
      throw SignUpFailure();
    }
  }

  Future<void> confirmSignUp({
    @required String email,
    @required String confirmationCode,
  }) async {
    assert(email != null && confirmationCode != null);
    try {
      var result = await Amplify.Auth.confirmSignUp(
          username: email, confirmationCode: confirmationCode);
      print(result.isSignUpComplete);
      print(result.nextStep);
    } catch (e) {
      print(e);
      throw SignUpFailure();
    }
  }

  /// Starts the Sign In with Google Flow.
  ///
  /// Throws a [LogInWithGoogleFailure] if an exception occurs.
  Future<void> logInWithGoogle() async {
    // try {
    //   final googleUser = await _googleSignIn.signIn();
    //   final googleAuth = await googleUser.authentication;
    //   final credential = firebase_auth.GoogleAuthProvider.credential(
    //     accessToken: googleAuth.accessToken,
    //     idToken: googleAuth.idToken,
    //   );
    //   await _firebaseAuth.signInWithCredential(credential);
    // } on Exception {
    //   throw LogInWithGoogleFailure();
    // }
  }

  /// Signs in with the provided [email] and [password].
  ///
  /// Throws a [LogInWithEmailAndPasswordFailure] if an exception occurs.
  Future<void> logInWithEmailAndPassword({
    @required String email,
    @required String password,
  }) async {
    assert(email != null && password != null);

    try {
      // Map<String, String> attrib = HashMap();
      var res = await Amplify.Auth.signIn(
        username: email,
        password: password,
      );
      print(res);
    } catch (e) {
      print(e.message);
    }
    // try {
    //   await _firebaseAuth.signInWithEmailAndPassword(
    //     email: email,
    //     password: password,
    //   );
    // } on Exception {
    //   throw LogInWithEmailAndPasswordFailure();
    // }
  }

  /// Signs out the current user which will emit
  /// [User.empty] from the [user] Stream.
  ///
  /// Throws a [LogOutFailure] if an exception occurs.
  Future<void> logOut() async {
    // try {
    //   await Future.wait([
    //     _firebaseAuth.signOut(),
    //     _googleSignIn.signOut(),
    //   ]);
    // } on Exception {
    //   throw LogOutFailure();
    // }
  }
}

// extension on firebase_auth.User {
//   User get toUser {
//     return User(id: uid, email: email, name: displayName, photo: photoURL);
//   }
// }
