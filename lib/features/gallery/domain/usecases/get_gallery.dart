import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/apod_entity.dart';
import '../interfaces/apod_interface.dart';

class ParamsUseCaseGetGallery {
  const ParamsUseCaseGetGallery();
}

class GetGalleryResult {
  final List<ApodEntity> response;
  const GetGalleryResult({
    required this.response,
  });
}

class GetGalleryUseCase
    extends UseCase<GetGalleryResult, ParamsUseCaseGetGallery> {
  final ApodInterface repository;

  GetGalleryUseCase({required this.repository});

  @override
  Future<Either<Failure, GetGalleryResult>> call(
      ParamsUseCaseGetGallery params) async {
    final checkResult = await repository.getGallery();

    return checkResult.fold(
      (failure) => Left(failure),
      (result) => Right(
        GetGalleryResult(response: result),
      ),
    );
  }
}
