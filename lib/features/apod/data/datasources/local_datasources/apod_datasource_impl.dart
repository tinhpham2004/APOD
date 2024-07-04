import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/entities/apod_entity.dart';
import 'apod_datasource.dart';

class ApodClientImpl implements ApodClient {
  static const String favoriteKey = 'favorite';

  @override
  Future<List<ApodEntity>> addFavourite(
      {required ApodEntity apodEntity}) async {
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

    bool result = false;

    favorites
        .map((item) => ApodEntity.fromJson(jsonDecode(item)))
        .toList()
        .forEach((element) {
      if (element.date == apodEntity.date) result = true;
    });

    return result;
  }
}
