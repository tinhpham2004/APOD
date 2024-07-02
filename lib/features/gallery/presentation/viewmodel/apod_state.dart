part of 'apod_bloc.dart';

abstract class ApodState extends Equatable {
  const ApodState();
}

// Get ApodState State for ApodState feature /// -----------------------------------/// -----------------------------------/// -----------------------------------
class InitGetApodState extends ApodState {
  @override
  List<Object?> get props => [];
}

class LoadingGetApodState extends ApodState {
  @override
  List<Object?> get props => [];
}

class SuccessGetApodState extends ApodState {
  final List<ApodEntity> apodEntities;

  const SuccessGetApodState({
    required this.apodEntities,
  });

  @override
  List<Object?> get props => [apodEntities];
}

class FailedGetApodState extends ApodState {
  @override
  List<Object?> get props => [];
}

class GetGalleryState extends ApodState {
  final List<ApodEntity> apodEntities;

  const GetGalleryState({
    required this.apodEntities,
  });

  @override
  List<Object?> get props => [apodEntities];

  @override
  String toString() {
    return '''
      ApodState State: ${apodEntities.toString()}
      ''';
  }
}

/// -----------------------------------/// -----------------------------------/// -----------------------------------/// -----------------------------------
