import 'package:apod/core/network/failure.dart';
import 'package:apod/features/apod/domain/entities/apod_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CalendarInterface {
  Future<Either<Failure, ApodEntity>> getCalendar({required DateTime date});
}