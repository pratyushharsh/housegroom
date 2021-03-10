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

  }

  /// Signs in with the provided [email] and [password].
  ///
  /// Throws a [LogInWithEmailAndPasswordFailure] if an exception occurs.
  Future<bool> logInWithEmailAndPassword({
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
      return res.isSignedIn;
    } on Exception catch (e) {
      print(e);
      throw LogInWithEmailAndPasswordFailure();
    }
  }

}
