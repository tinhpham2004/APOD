import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../../../apod/domain/entities/apod_entity.dart';

abstract class FavouriteInterface {
  Future<Either<Failure, List<ApodEntity>>> getFavourite();
}
