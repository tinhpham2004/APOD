import 'dart:convert';

import 'package:apod/features/favourite/data/datasources/local_datasources/favourite_datasource.dart';
import 'package:apod/features/apod/data/models/apod_model.dart';
import 'package:apod/features/apod/domain/entities/apod_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteClientImpl implements FavouriteClient {
  static const String favoriteKey = 'favorite';
  
  @override
  Future<List<ApodEntity>> getFavourite() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList(favoriteKey) ?? [];

    return favorites
        .map((item) => ApodEntity.fromJson(jsonDecode(item)))
        .toList();
  }
}
