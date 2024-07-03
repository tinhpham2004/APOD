import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/apod_entity.dart';
import '../interfaces/apod_interface.dart';

class ParamsUseCaseGetCalendar {
  final DateTime date;
  const ParamsUseCaseGetCalendar({required this.date});
}

class GetCalendarResult {
  final ApodEntity response;
  const GetCalendarResult({
    required this.response,
  });
}

class GetCalendarUseCase
    extends UseCase<GetCalendarResult, ParamsUseCaseGetCalendar> {
  final ApodInterface repository;

  GetCalendarUseCase({required this.repository});

  @override
  Future<Either<Failure, GetCalendarResult>> call(
      ParamsUseCaseGetCalendar params) async {
    final checkResult = await repository.getCalendar(date: params.date);

    return checkResult.fold(
      (failure) => Left(failure),
      (result) => Right(
        GetCalendarResult(response: result),
      ),
    );
  }
}
