import 'package:flutter/material.dart';
import 'package:housegroom/ProfilePage/view/domestic-worker-profile.dart';
import 'package:housegroom/home/view/home_page.dart';
import 'package:housegroom/listing/view/listing.dart';
import 'package:housegroom/search/view/search.dart';

class RouteConfiguration {
  static const String HOME_PAGE = "/";
  static const String DOMESTIC_HELPER_SEARCH = "/domestic-helper";
  static const String LISTING_PAGE = "/profile_listing";
  static const String DOMESTIC_WORKER_PROFILE_PAGE = "/domestic_worker_profile";

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HOME_PAGE:
        return MaterialPageRoute(builder: (_) => HomePage());
      case DOMESTIC_HELPER_SEARCH:
        return MaterialPageRoute(builder: (_) => DomesticHelperSearch());
      case LISTING_PAGE:
        return MaterialPageRoute(builder: (_) => Listing());
      case DOMESTIC_WORKER_PROFILE_PAGE:
        return MaterialPageRoute(builder: (_) => DomesticWorkerProfilePage());
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
