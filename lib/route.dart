import 'package:flutter/material.dart';

import 'home/view/home_page.dart';

class RouteConfiguration {
  static const String HOME_PAGE = "/";


  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HOME_PAGE:
        return MaterialPageRoute(builder: (_) => HomePage());
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