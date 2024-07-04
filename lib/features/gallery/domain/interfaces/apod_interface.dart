import 'package:apod/core/network/failure.dart';
import 'package:apod/features/apod/domain/entities/apod_entity.dart';
import 'package:dartz/dartz.dart';

abstract class GalleryInterface {
  Future<Either<Failure, List<ApodEntity>>> getGallery();
}