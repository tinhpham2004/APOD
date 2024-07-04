part of 'gallery_bloc.dart';

abstract class GalleryState extends Equatable {
  const GalleryState();
}

// Get GalleryState State for GalleryState feature /// -----------------------------------/// -----------------------------------/// -----------------------------------
class InitGetGalleryState extends GalleryState {
  @override
  List<Object?> get props => [];
}

class LoadingGetGalleryState extends GalleryState {
  @override
  List<Object?> get props => [];
}

class SuccessGetGalleryState extends GalleryState {
  final List<ApodEntity> apodEntities;

  const SuccessGetGalleryState({
    required this.apodEntities,
  });

  @override
  List<Object?> get props => [apodEntities];
}

class FailedGetApodState extends GalleryState {
  @override
  List<Object?> get props => [];
}

class GetGalleryState extends GalleryState {
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
