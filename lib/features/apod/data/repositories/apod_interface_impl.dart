import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../../domain/entities/apod_entity.dart';
import '../../domain/interfaces/apod_interface.dart';
import '../datasources/local_datasources/apod_datasource.dart';

class ApodInterfaceImpl implements ApodInterface {
  final ApodClient apodClient;

  ApodInterfaceImpl({required this.apodClient});

  @override
  Future<Either<Failure, List<ApodEntity>>> addFavorite(
      {required ApodEntity apodEntity}) async {
    try {
      final response =
          await apodClient.addFavourite(apodEntity: apodEntity);
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
          await apodClient.removeFavourite(apodEntity: apodEntity);
      return Right(response);
    } on Object {
      return Left(ServerFailure());
    }
  }
  
  @override
  Future<Either<Failure, bool>> isFavourite({required ApodEntity apodEntity}) async {
    try {
      final response =
          await apodClient.isFavourite(apodEntity: apodEntity);
      return Right(response);
    } on Object {
      return Left(ServerFailure());
    }
  }
}