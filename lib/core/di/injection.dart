import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../features/gallery/presentation/view/gallery_screen.dart';

final getIt = GetIt.instance;

void setup() {
  // Blocs
  getIt.registerFactory(() => GalleryScreen());
  getIt.registerFactory(() => Container());
  
  // Add other dependencies like repositories, use cases, etc.
}