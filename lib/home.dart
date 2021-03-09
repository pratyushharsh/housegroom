import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housegroom/route.dart';
import 'package:housegroom/service/auth_repository/authentication_repository.dart';
import 'package:housegroom/service/auth_repository/models/user.dart';

import 'authentication/bloc/authentication_bloc.dart';
import 'home/view/home_page.dart';
import 'listing/bloc/listing_bloc.dart';
import 'login/view/login_page.dart';

class App extends StatelessWidget {
  final AuthenticationRepository authRepo;

  const App({Key key, this.authRepo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [RepositoryProvider(create: (_) => authRepo)],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) =>
                  AuthenticationBloc(authenticationRepository: authRepo)
                    ..add(AuthenticationUserChanged(User.empty))),
          BlocProvider(create: (_) => ListingBloc())
        ],
        child: AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                _navigator.pushAndRemoveUntil<void>(
                  HomePage.route(),
                  (route) => false,
                );
                break;
              case AuthenticationStatus.unauthenticated:
                _navigator.pushAndRemoveUntil<void>(
                  LoginPage.route(),
                  (route) => false,
                );
                break;
              default:
                _navigator.pushAndRemoveUntil<void>(
                  LoginPage.route(),
                  (route) => false,
                );
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: RouteConfiguration.onGenerateRoute,
    );
  }
}
