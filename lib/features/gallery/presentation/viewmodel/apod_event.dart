part of 'apod_bloc.dart';

abstract class ApodEvent extends Equatable {
  const ApodEvent();

  @override
  List<Object> get props => [];
}

// Get Event Action /// -----------------------------------/// -----------------------------------/// -----------------------------------
class GetGalleryEvent extends ApodEvent {
  const GetGalleryEvent();
  @override
  List<Object> get props => [];
}

class GetCalendarEvent extends ApodEvent {
  final DateTime date;

  const GetCalendarEvent({required this.date});

  @override
  List<Object> get props => [date];
}
/// -----------------------------------/// -----------------------------------/// -----------------------------------/// -----------------------------------