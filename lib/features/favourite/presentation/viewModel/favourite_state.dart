part of 'favourite_bloc.dart';

abstract class FavouriteState extends Equatable {
  const FavouriteState();
}

// Get FavouriteState State for FavouriteState feature /// -----------------------------------/// -----------------------------------/// -----------------------------------
class InitGetFavouriteState extends FavouriteState {
  @override
  List<Object?> get props => [];
}

class LoadingGetFavouriteState extends FavouriteState {
  @override
  List<Object?> get props => [];
}

class SuccessGetFavouriteState extends FavouriteState {
  final List<ApodEntity> apodEntities;

  const SuccessGetFavouriteState({
    required this.apodEntities,
  });

  @override
  List<Object?> get props => [apodEntities];
}

class FailedGetFavouriteState extends FavouriteState {
  @override
  List<Object?> get props => [];
}

class GetFavouriteState extends FavouriteState {
  final List<ApodEntity> apodEntities;

  const GetFavouriteState({
    required this.apodEntities,
  });

  @override
  List<Object?> get props => [apodEntities];

  @override
  String toString() {
    return '''
      FavouriteState State: ${apodEntities.toString()}
      ''';
  }
}

/// -----------------------------------/// -----------------------------------/// -----------------------------------/// -----------------------------------
