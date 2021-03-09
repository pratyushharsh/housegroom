import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housegroom/bloc_observer.dart';
import 'package:housegroom/listing/bloc/listing_bloc.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:housegroom/service/auth_repository/authentication_repository.dart';

import 'home.dart';

import 'amplifyconfiguration.dart';

void _initAmplifyFlutter() async {
  try {
    AmplifyAuthCognito auth = AmplifyAuthCognito();
    await Amplify.addPlugin(auth);
    await Amplify.configure(amplifyconfig);
    print('Aws Configured');
  } on AmplifyAlreadyConfiguredException {
    print(
        "Amplify was already configured. Looks like app restarted on android.");
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _initAmplifyFlutter();

  AuthenticationRepository repo = AuthenticationRepository();
  Bloc.observer = HouseGroomBlockObserver();
  runApp(App(authRepo: repo,));
}
