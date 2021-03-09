import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housegroom/login/bloc/login_bloc.dart';

import '../../route.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
      },
      child: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: PageFlatbutton(title: "Skip"),
                  ),
                  SizedBox(height: 20),
                  Image.asset(
                    "images/groom1.png",
                    fit: BoxFit.fill,
                    height: 100,
                    width: 100,
                  ),
                  Text(
                    "Housegroom",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Pagetext(title: "Home Service Expert"),
                  SizedBox(height: 100),
                  //
                  _UsernameInput(),
                  SizedBox(
                    height: 10,
                  ),
                  _PasswordInput(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: PageFlatbutton(title: 'Forgotten Password?'),
                  ),
                  _LoginButton(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Pagetext(title: 'New user?'),
                      PageFlatbutton(
                        title: 'Register here',
                        //TODO:route not working
                        onpresssed: () {
                          Navigator.of(context)
                              .pushNamed(RouteConfiguration.SIGNUPPAGE);
                        },
                      )
                    ],
                  ),
                  Center(
                    child: Pagetext(
                      title:
                          "By continue, you agree to our Terms & Conditions" +
                              "\n                           and Privacy Policy",
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_usernameInput_textField'),
          onChanged: (username) =>
              context.read<LoginBloc>().add(LoginUsernameChanged(username)),
          decoration: InputDecoration(
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
            hintText: 'Enter your Email address',
            hintStyle: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.normal),
            labelText: 'Email address',
            labelStyle:
                TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            errorText: state.username.invalid ? 'invalid username' : null,
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<LoginBloc>().add(LoginPasswordChanged(password)),
          obscureText: true,
          decoration: InputDecoration(
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
            hintText: 'Enter your password',
            hintStyle: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.normal),
            labelText: 'Password',
            labelStyle:
                TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            errorText: state.password.invalid ? 'invalid password' : null,
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('loginForm_continue_raisedButton'),
                child: const Text('Login'),
                onPressed: state.status.isValidated
                    ? () {
                        context.read<LoginBloc>().add(const LoginSubmitted());
                      }
                    : null,
              );
      },
    );
  }
}

class Pagetext extends StatelessWidget {
  final String title;
  Pagetext({this.title});
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: Colors.grey[600], fontSize: 14, fontWeight: FontWeight.normal),
    );
  }
}

//flatbutton
class PageFlatbutton extends StatelessWidget {
  final String title;
  final Function onpresssed;
  PageFlatbutton({this.title, this.onpresssed});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(title),
      onPressed: onpresssed,
    );
  }
}
