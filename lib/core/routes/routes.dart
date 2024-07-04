import 'package:apod/features/apod/domain/entities/apod_entity.dart';
import 'package:apod/features/apod/presentation/view/apod_screen.dart';
import 'package:apod/features/calendar/presentation/view/calendar_screen.dart';
import 'package:flutter/material.dart';

import '../../features/favourite/presentation/view/favourite_screen.dart';
import '../../features/gallery/presentation/view/gallery_screen.dart';

class Routes {
  static const String intro = '/intro';
  static const String gallery = '/gallery';
  static const String apod = '/apod';
  static const String calendar = '/calendar';
  static const String favourite = '/favourite';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case intro:
        return MaterialPageRoute(builder: (_) => Container());
      case gallery:
        return MaterialPageRoute(builder: (_) => GalleryScreen());
      case apod:
        final ApodEntity apod = settings.arguments as ApodEntity;
        return MaterialPageRoute(
            settings: RouteSettings(arguments: apod),
            builder: (_) {
              return ApodScreen();
            });
      case calendar:
        return MaterialPageRoute(builder: (_) => CalendarScreen());
      case favourite:
        return MaterialPageRoute(builder: (_) => FavouriteScreen());
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
