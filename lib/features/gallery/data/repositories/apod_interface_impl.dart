import 'package:apod/core/network/failure.dart';
import 'package:apod/features/gallery/data/datasources/apod_datasource.dart';
import 'package:apod/features/gallery/domain/entities/apod_entity.dart';
import 'package:apod/features/gallery/domain/interfaces/apod_interface.dart';
import 'package:dartz/dartz.dart';

class ApodInterfaceImpl implements ApodInterface {
  final ApodClient apodClient;

  ApodInterfaceImpl({
    required this.apodClient,
  });

  @override
  Future<Either<Failure, List<ApodEntity>>> getGallery(
      {required int page}) async {
    try {
      final response = await apodClient.getGallery(page: page);
      return Right(response);
    } on Object {
      return Left(ServerFailure());
    }
  }
}