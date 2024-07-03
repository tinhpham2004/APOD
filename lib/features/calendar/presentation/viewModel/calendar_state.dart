part of 'calendar_bloc.dart';

abstract class CalendarState extends Equatable {
  const CalendarState();
}

// Get CalendarState State for CalendarState feature /// -----------------------------------/// -----------------------------------/// -----------------------------------
class InitGetCalendarState extends CalendarState {
  @override
  List<Object?> get props => [];
}

class LoadingGetCalendarState extends CalendarState {
  @override
  List<Object?> get props => [];
}

class SuccessGetCalendarState extends CalendarState {
  final List<ApodEntity> apodEntities;

  const SuccessGetCalendarState({
    required this.apodEntities,
  });

  @override
  List<Object?> get props => [apodEntities];
}

class FailedGetCalendarState extends CalendarState {
  @override
  List<Object?> get props => [];
}

class GetCalendarState extends CalendarState {
  final ApodEntity apodEntity;

  const GetCalendarState({
    required this.apodEntity,
  });

  @override
  List<Object?> get props => [apodEntity];

  @override
  String toString() {
    return '''
      CalendarState State: ${apodEntity.toString()}
      ''';
  }
}

/// -----------------------------------/// -----------------------------------/// -----------------------------------/// -----------------------------------
