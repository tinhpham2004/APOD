import 'package:apod/features/calendar/domain/interfaces/calendar_interfaces.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../gallery/domain/entities/apod_entity.dart';

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
  final CalendarInterface repository;

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
