import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../gallery/domain/entities/apod_entity.dart';
import '../interfaces/favourite_interface.dart';

class ParamsUseCaseRemoveFavourite {
  final ApodEntity apodEntity;
  const ParamsUseCaseRemoveFavourite({required this.apodEntity});
}

class RemoveFavouriteResult {
  final List<ApodEntity> response;

  const RemoveFavouriteResult({required this.response});
}

class RemoveFavouriteUseCase
    extends UseCase<RemoveFavouriteResult, ParamsUseCaseRemoveFavourite> {
  final FavouriteInterface repository;

  RemoveFavouriteUseCase({required this.repository});

  @override
  Future<Either<Failure, RemoveFavouriteResult>> call(
      ParamsUseCaseRemoveFavourite params) async {
    final checkResult =
        await repository.removeFavourite(apodEntity: params.apodEntity);

    return checkResult.fold(
      (failure) => Left(failure),
      (result) => Right(
        RemoveFavouriteResult(response: result),
      ),
    );
  }
}
