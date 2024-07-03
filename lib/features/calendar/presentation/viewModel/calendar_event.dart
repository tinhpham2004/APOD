part of 'calendar_bloc.dart';

abstract class CalendarEvent extends Equatable {
  const CalendarEvent();

  @override
  List<Object> get props => [];
}

// Get Event Action /// -----------------------------------/// -----------------------------------/// -----------------------------------

class GetCalendarEvent extends CalendarEvent {
  final DateTime date;

  const GetCalendarEvent({required this.date});

  @override
  List<Object> get props => [date];
}
/// -----------------------------------/// -----------------------------------/// -----------------------------------/// -----------------------------------