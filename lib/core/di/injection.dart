import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  // Blocs
  getIt.registerFactory(() => Container());
  getIt.registerFactory(() => Container());
  
  // Add other dependencies like repositories, use cases, etc.
}