import 'package:flutter/material.dart';
import 'package:housegroom/Booking-details/view/booking_details.dart';
import 'package:housegroom/search/view/search.dart';

class RouteConfiguration {
  static const String HOME_PAGE = "/";

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HOME_PAGE:
        return MaterialPageRoute(builder: (_) => BookingDetails());
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
