import 'package:apod/core/network/failure.dart';
import 'package:apod/features/favourite/data/datasources/local_datasources/favourite_datasource.dart';
import 'package:apod/features/favourite/domain/interfaces/favourite_interface.dart';
import 'package:apod/features/apod/domain/entities/apod_entity.dart';
import 'package:dartz/dartz.dart';

class FavouriteInterfaceImpl implements FavouriteInterface {
  final FavouriteClient favouriteClient;

  FavouriteInterfaceImpl({required this.favouriteClient});

  @override
  Future<Either<Failure, List<ApodEntity>>> getFavourite() async {
    try {
      final response = await favouriteClient.getFavourite();
      return Right(response);
    } on Object {
      return Left(ServerFailure());
    }
  }
}
