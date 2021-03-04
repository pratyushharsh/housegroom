import 'package:flutter/material.dart';
import 'package:housegroom/listing/view/listing.dart';
import 'package:housegroom/search/view/search.dart';
import 'package:housegroom/signin/view/sign-in.dart';

class RouteConfiguration {
  static const String HOME_PAGE = "/";

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HOME_PAGE:
        return MaterialPageRoute(builder: (_) => SignIn());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
