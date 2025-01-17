import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/apod_entity.dart';
import '../interfaces/apod_interface.dart';

class ParamsUseCaseIsFavourite {
  final ApodEntity apodEntity;
  const ParamsUseCaseIsFavourite({required this.apodEntity});
}

class IsFavouriteResult {
  final bool response;

  const IsFavouriteResult({required this.response});
}

class IsFavouriteUseCase
    extends UseCase<IsFavouriteResult, ParamsUseCaseIsFavourite> {
  final ApodInterface repository;

  IsFavouriteUseCase({required this.repository});

  @override
  Future<Either<Failure, IsFavouriteResult>> call(
      ParamsUseCaseIsFavourite params) async {
    final checkResult =
        await repository.isFavourite(apodEntity: params.apodEntity);

    return checkResult.fold(
      (failure) => Left(failure),
      (result) => Right(
        IsFavouriteResult(response: result),
      ),
    );
  }
}