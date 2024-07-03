import 'package:apod/features/gallery/domain/entities/apod_entity.dart';

import '../../../../gallery/data/models/apod_model.dart';

abstract class FavouriteClient {
  Future<List<ApodEntity>> getFavourite();
  Future<List<ApodEntity>> addFavourite({required ApodEntity apodEntity});
  Future<List<ApodEntity>> removeFavourite({required ApodEntity apodEntity});
  Future<bool> isFavourite({required ApodEntity apodEntity});
}
