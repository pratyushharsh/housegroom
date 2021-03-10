import 'dart:async';

import 'package:amplify_flutter/amplify.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:housegroom/service/auth_repository/authentication_repository.dart';
import 'package:housegroom/service/auth_repository/models/user.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    @required AuthenticationRepository authenticationRepository,
  })  : assert(authenticationRepository != null),
        _authenticationRepository = authenticationRepository,
        super(const AuthenticationState.unauthenticated()) {
    signInIfSessinAvailable();
    _subscription = Amplify.Hub.listen([HubChannel.Auth], (hubEvent) {
      print("*******************************");
      print(hubEvent);
      print(hubEvent.eventName);
      print("*******************************");
      switch (hubEvent.eventName) {
        case 'SIGNED_IN':
          break;
        case 'SIGNED_OUT':
          add(AuthenticationUserChanged(User.empty));
          break;
        case 'SESSION_EXPIRED':
          break;
      }
    });
  }

  signInIfSessinAvailable() async {
    print('Getting if user already present');
    // final session = await Amplify.Auth.fetchAuthSession();
    // if (session.isSignedIn) {
    //   print('User Alreadu Present');
    // }
    // try {
    //   CognitoAuthSession res = await Amplify.Auth.fetchAuthSession(
    //       options: CognitoSessionOptions(getAWSCredentials: true));
    //   print(res.userSub);
    //   print(res.identityId);
    // } on AmplifyException catch (e) {
    //
    //   print(e);
    // }
    try {
      var res = await Amplify.Auth.getCurrentUser();
      if (res != null) {
        User usr = User(
          id: res.userId,
          email: res.username
        );
        add(AuthenticationUserChanged(usr));
      }
      print(res.userId);
      print('Current User Name = ' + res.username);
    } on AmplifyException catch (e) {
      print(e);
    }
  }

  final AuthenticationRepository _authenticationRepository;
  StreamSubscription<User> _userSubscription;
  StreamSubscription _subscription;

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AuthenticationUserChanged) {
      yield _mapAuthenticationUserChangedToState(event);
    } else if (event is AuthenticationLogoutRequested) {
      try {
        await Amplify.Auth.signOut();
      } on AmplifyException catch (e) {
        print(e);
      }
    }
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }

  AuthenticationState _mapAuthenticationUserChangedToState(
    AuthenticationUserChanged event,
  ) {
    return event.user != User.empty
        ? AuthenticationState.authenticated(event.user)
        : const AuthenticationState.unauthenticated();
  }
}
