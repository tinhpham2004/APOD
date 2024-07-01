part of 'apod_bloc.dart';

abstract class ApodEvent extends Equatable {
  const ApodEvent();

  @override
  List<Object> get props => [];
}

// Get Random Event Action /// -----------------------------------/// -----------------------------------/// -----------------------------------
class GetGalleryEvent extends ApodEvent {
  final int page;
  const GetGalleryEvent({required this.page});
  @override
  List<Object> get props => [page];
}
/// -----------------------------------/// -----------------------------------/// -----------------------------------/// -----------------------------------