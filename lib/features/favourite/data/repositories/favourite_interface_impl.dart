import 'package:apod/core/network/failure.dart';
import 'package:apod/features/favourite/data/datasources/local_datasources/favourite_datasource.dart';
import 'package:apod/features/favourite/domain/interfaces/favourite_interface.dart';
import 'package:apod/features/gallery/domain/entities/apod_entity.dart';
import 'package:dartz/dartz.dart';

class FavouriteInterfaceImpl implements FavouriteInterface {
  final FavouriteClient favouriteClient;

  FavouriteInterfaceImpl({required this.favouriteClient});

  @override
  Future<Either<Failure, List<ApodEntity>>> addFavorite(
      {required ApodEntity apodEntity}) async {
    try {
      final response =
          await favouriteClient.addFavourite(apodEntity: apodEntity);
      return Right(response);
    } on Object {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ApodEntity>>> getFavourite() async {
    try {
      final response = await favouriteClient.getFavourite();
      return Right(response);
    } on Object {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ApodEntity>>> removeFavourite(
      {required ApodEntity apodEntity}) async {
    try {
      final response =
          await favouriteClient.removeFavourite(apodEntity: apodEntity);
      return Right(response);
    } on Object {
      return Left(ServerFailure());
    }
  }
  
  @override
  Future<Either<Failure, bool>> isFavourite({required ApodEntity apodEntity}) async {
    try {
      final response =
          await favouriteClient.isFavourite(apodEntity: apodEntity);
      return Right(response);
    } on Object {
      return Left(ServerFailure());
    }
  }
}
