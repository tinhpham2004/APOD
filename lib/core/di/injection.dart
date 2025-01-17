import 'package:apod/features/gallery/di/dependecy_injection.dart';
import 'package:apod/features/apod/presentation/view/apod_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../features/apod/di/dependecy_injection.dart';
import '../../features/calendar/di/dependecy_injection.dart';
import '../../features/favourite/di/dependecy_injection.dart';
import '../../features/gallery/presentation/view/gallery_screen.dart';
import '../network/network_info.dart';
import '../network/server_api_client.dart';

final getIt = GetIt.instance;

void setup() {
  // Network Handler
  getIt.registerLazySingleton<NetworkInfoRepository>(
    () => NetworkInfoRepositoryImpl(),
  );
  // Server API Client
  getIt.registerLazySingleton(
    () => ServerApiClient(
      networkInfoRepository: getIt(),
    ),
  );

  // Add other dependencies like repositories, use cases, etc.
}

Future<void> initFeaturesDependecies() async {
  getIt.pushNewScope();
  await initGallery();
  await initCalendar();
  await initFavourite();
  await initApod();
}
