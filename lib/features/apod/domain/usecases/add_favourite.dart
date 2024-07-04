import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/apod_entity.dart';
import '../interfaces/apod_interface.dart';

class ParamsUseCaseAddFavourite {
  final ApodEntity apodEntity;
  const ParamsUseCaseAddFavourite({required this.apodEntity});
}

class AddFavouriteResult {
  final List<ApodEntity> response;
  const AddFavouriteResult({required this.response});
}

class AddFavouriteUseCase
    extends UseCase<AddFavouriteResult, ParamsUseCaseAddFavourite> {
  final ApodInterface repository;

  AddFavouriteUseCase({required this.repository});

  @override
  Future<Either<Failure, AddFavouriteResult>> call(
      ParamsUseCaseAddFavourite params) async {
    final checkResult =
        await repository.addFavorite(apodEntity: params.apodEntity);

    return checkResult.fold(
      (failure) => Left(failure),
      (result) => Right(
        AddFavouriteResult(response: result),
      ),
    );
  }
}
