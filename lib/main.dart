import 'package:apod/core/di/injection.dart';
import 'package:apod/my_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await initFeaturesDependecies();
  runApp(MyApp());
}
