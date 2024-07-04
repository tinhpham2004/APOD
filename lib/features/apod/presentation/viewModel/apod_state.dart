part of 'apod_bloc.dart';

abstract class ApodState extends Equatable {
  const ApodState();
}

// Get ApodState State for ApodState feature /// -----------------------------------/// -----------------------------------/// -----------------------------------
class InitApodState extends ApodState {
  @override
  List<Object?> get props => [];
}

class LoadingApodState extends ApodState {
  @override
  List<Object?> get props => [];
}

class SuccessApodState extends ApodState {
  final bool isFavourite;

  const SuccessApodState({
    required this.isFavourite,
  });

  @override
  List<Object?> get props => [isFavourite];
}

class FailedApodState extends ApodState {
  @override
  List<Object?> get props => [];
}

class GetApodState extends ApodState {
  final bool isFavourite;

  const GetApodState({
    required this.isFavourite,
  });

  @override
  List<Object?> get props => [isFavourite];

  @override
  String toString() {
    return '''
      ApodState State: ${isFavourite.toString()}
      ''';
  }
}


/// -----------------------------------/// -----------------------------------/// -----------------------------------/// -----------------------------------
