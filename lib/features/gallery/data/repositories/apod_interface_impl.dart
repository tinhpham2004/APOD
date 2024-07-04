import 'package:apod/core/network/failure.dart';
import 'package:apod/features/gallery/data/datasources/remote_datasources/gallery_datasource.dart';
import 'package:apod/features/apod/domain/entities/apod_entity.dart';
import 'package:apod/features/gallery/domain/interfaces/apod_interface.dart';
import 'package:dartz/dartz.dart';

class GalleryInterfaceImpl implements GalleryInterface {
  final GalleryClient galleryClient;

  GalleryInterfaceImpl({
    required this.galleryClient,
  });

  @override
  Future<Either<Failure, List<ApodEntity>>> getGallery() async {
    try {
      final response = await galleryClient.getGallery();
      return Right(response);
    } on Object {
      return Left(ServerFailure());
    }
  }
}
