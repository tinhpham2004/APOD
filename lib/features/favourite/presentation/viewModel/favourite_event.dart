part of 'favourite_bloc.dart';

abstract class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object> get props => [];
}

// Get Event Action /// -----------------------------------/// -----------------------------------/// -----------------------------------

class GetFavouriteEvent extends FavouriteEvent {
  const GetFavouriteEvent();

  @override
  List<Object> get props => [];
}

class AddFavouriteEvent extends FavouriteEvent {
  final ApodEntity apodEntity;
  const AddFavouriteEvent({required this.apodEntity});

  @override
  List<Object> get props => [apodEntity];
}

class RemoveFavouriteEvent extends FavouriteEvent {
  final ApodEntity apodEntity;
  const RemoveFavouriteEvent({required this.apodEntity});

  @override
  List<Object> get props => [apodEntity];
}

class IsFavouriteEvent extends FavouriteEvent {
  final ApodEntity apodEntity;
  const IsFavouriteEvent({required this.apodEntity});

  @override
  List<Object> get props => [apodEntity];
}
/// -----------------------------------/// -----------------------------------/// -----------------------------------/// -----------------------------------