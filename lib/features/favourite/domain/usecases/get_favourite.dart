import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../gallery/domain/entities/apod_entity.dart';
import '../interfaces/favourite_interface.dart';

class ParamsUseCaseGetFavourite {
  const ParamsUseCaseGetFavourite();
}

class GetFavouriteResult {
  final List<ApodEntity> response;
  const GetFavouriteResult({
    required this.response,
  });
}

class GetFavouriteUseCase
    extends UseCase<GetFavouriteResult, ParamsUseCaseGetFavourite> {
  final FavouriteInterface repository;

  GetFavouriteUseCase({required this.repository});

  @override
  Future<Either<Failure, GetFavouriteResult>> call(
      ParamsUseCaseGetFavourite params) async {
    final checkResult = await repository.getFavourite();

    return checkResult.fold(
      (failure) => Left(failure),
      (result) => Right(
        GetFavouriteResult(response: result),
      ),
    );
  }
}
