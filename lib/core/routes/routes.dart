import 'package:apod/features/gallery/domain/entities/apod_entity.dart';
import 'package:apod/features/gallery/presentation/view/apod_screen.dart';
import 'package:apod/features/calendar/presentation/view/calendar_screen.dart';
import 'package:flutter/material.dart';

import '../../features/gallery/presentation/view/gallery_screen.dart';

class Routes {
  static const String intro = '/intro';
  static const String gallery = '/gallery';
  static const String apod = '/apod';
  static const String calendar = '/calendar';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case intro:
        return MaterialPageRoute(builder: (_) => Container());
      case gallery:
        return MaterialPageRoute(builder: (_) => GalleryScreen());
      case apod:
        // return MaterialPageRoute(builder: (_) => PlantDetailPage(galleryId: id));
        final ApodEntity apod = settings.arguments as ApodEntity;
        return MaterialPageRoute(
            settings: RouteSettings(arguments: apod),
            builder: (_) {
              return ApodScreen();
            });
      case calendar:
        return MaterialPageRoute(builder: (_) => CalendarScreen());
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
