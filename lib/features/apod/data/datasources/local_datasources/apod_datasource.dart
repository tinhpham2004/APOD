import '../../../domain/entities/apod_entity.dart';

abstract class ApodClient {
  Future<List<ApodEntity>> addFavourite({required ApodEntity apodEntity});
  Future<List<ApodEntity>> removeFavourite({required ApodEntity apodEntity});
  Future<bool> isFavourite({required ApodEntity apodEntity});
}