part of 'apod_bloc.dart';

abstract class ApodEvent extends Equatable {
  const ApodEvent();

  @override
  List<Object> get props => [];
}

// Get Event Action /// -----------------------------------/// -----------------------------------/// -----------------------------------

class GetApodEvent extends ApodEvent {
  const GetApodEvent();

  @override
  List<Object> get props => [];
}

class AddApodEvent extends ApodEvent {
  final ApodEntity apodEntity;
  const AddApodEvent({required this.apodEntity});

  @override
  List<Object> get props => [apodEntity];
}

class RemoveApodEvent extends ApodEvent {
  final ApodEntity apodEntity;
  const RemoveApodEvent({required this.apodEntity});

  @override
  List<Object> get props => [apodEntity];
}

class InitApodEvent extends ApodEvent {
  final ApodEntity apodEntity;
  const InitApodEvent({required this.apodEntity});

  @override
  List<Object> get props => [apodEntity];
}