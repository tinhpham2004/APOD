import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../../../gallery/domain/entities/apod_entity.dart';

abstract class FavouriteInterface {
  Future<Either<Failure, List<ApodEntity>>> getFavourite();
  Future<Either<Failure, List<ApodEntity>>> addFavorite(
      {required ApodEntity apodEntity});
  Future<Either<Failure, List<ApodEntity>>> removeFavourite(
      {required ApodEntity apodEntity});
  Future<Either<Failure, bool>> isFavourite({required ApodEntity apodEntity});
}
