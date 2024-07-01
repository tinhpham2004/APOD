import 'package:apod/core/routes/routes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.gallery,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
