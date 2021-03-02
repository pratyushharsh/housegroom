import 'package:flutter/material.dart';
import 'package:housegroom/route.dart';

class AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteConfiguration.onGenerateRoute,
    );
  }
}
