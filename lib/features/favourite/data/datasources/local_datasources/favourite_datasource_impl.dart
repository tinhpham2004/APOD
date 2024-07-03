import 'dart:convert';

import 'package:apod/features/favourite/data/datasources/local_datasources/favourite_datasource.dart';
import 'package:apod/features/gallery/data/models/apod_model.dart';
import 'package:apod/features/gallery/domain/entities/apod_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteClientImpl implements FavouriteClient {
  static const String favoriteKey = 'favorite';

  @override
  Future<List<ApodEntity>> addFavourite({required ApodEntity apodEntity}) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList(favoriteKey) ?? [];

    String apodJson = jsonEncode(apodEntity.toJson());
    favorites.add(apodJson);

    await prefs.setStringList(favoriteKey, favorites);
    return favorites
        .map((item) => ApodEntity.fromJson(jsonDecode(item)))
        .toList();
  }

  @override
  Future<List<ApodEntity>> getFavourite() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList(favoriteKey) ?? [];

    return favorites
        .map((item) => ApodEntity.fromJson(jsonDecode(item)))
        .toList();
  }

  @override
  Future<List<ApodEntity>> removeFavourite(
      {required ApodEntity apodEntity}) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList(favoriteKey) ?? [];

    favorites.removeWhere((item) {
      ApodEntity entity = ApodEntity.fromJson(jsonDecode(item));
      return entity.date == apodEntity.date;
    });

    await prefs.setStringList(favoriteKey, favorites);
    return favorites
        .map((item) => ApodEntity.fromJson(jsonDecode(item)))
        .toList();
  }

  @override
  Future<bool> isFavourite({required ApodEntity apodEntity}) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList(favoriteKey) ?? [];

    return favorites
        .map((item) => ApodEntity.fromJson(jsonDecode(item)))
        .toList()
        .contains(apodEntity);
  }
}
