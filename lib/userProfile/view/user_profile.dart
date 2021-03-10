import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housegroom/authentication/authentication.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            RaisedButton(
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context).add(AuthenticationLogoutRequested());
              },
              child: Text('Logout'),
            )
          ],
        ),
      ),
    );
  }
}
