import 'package:apod/core/colors/colors.dart';
import 'package:apod/core/routes/routes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Roboto-Regular',
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.transparent,
          surfaceTintColor: AppColors.transparent,
          elevation: 0,
        ),
        scaffoldBackgroundColor: AppColors.black,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.gallery,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
