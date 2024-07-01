import 'package:flutter/material.dart';

class Routes {
  static const String intro = '/intro';
  static const String gallery = '/gallery';
  static const String apod = '/apod';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case intro:
        return MaterialPageRoute(builder: (_) => Container());
      case gallery:
        return MaterialPageRoute(builder: (_) => Container());
      case apod:
        final id = settings.arguments as String;
        // return MaterialPageRoute(builder: (_) => PlantDetailPage(galleryId: id));
        return MaterialPageRoute(builder: (_) => Container());
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
