import 'package:apod/core/network/failure.dart';
import 'package:apod/features/gallery/domain/entities/apod_entity.dart';
import 'package:dartz/dartz.dart';

import '../../domain/interfaces/calendar_interface.dart';
import '../datasources/remote_datasources/calendar_datasource.dart';

class CalendarInterfaceImpl implements CalendarInterface {
  final CalendarClient calendarClient;

  CalendarInterfaceImpl({
    required this.calendarClient,
  });
  
  @override
  Future<Either<Failure, ApodEntity>> getCalendar({required DateTime date}) async {
    try {
      final response = await calendarClient.getCalendar(date: date);
      return Right(response);
    } on Object {
      return Left(ServerFailure());
    }
  }
}
