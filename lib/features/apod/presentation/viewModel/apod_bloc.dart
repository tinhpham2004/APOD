import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/apod_entity.dart';
import '../../domain/usecases/add_favourite.dart';
import '../../domain/usecases/is_favourite.dart';
import '../../domain/usecases/remove_favourite.dart';

part 'apod_event.dart';
part 'apod_state.dart';

class ApodViewModel extends Bloc<ApodEvent, ApodState> {
  final AddFavouriteUseCase addFavouriteUseCase;
  final RemoveFavouriteUseCase removeFavouriteUseCase;
  final IsFavouriteUseCase isFavouriteUseCase;

  ApodViewModel(
    this.addFavouriteUseCase,
    this.removeFavouriteUseCase,
    this.isFavouriteUseCase,
  ) : super(InitApodState()) {
    on<AddApodEvent>((event, emit) async {
      emit(await _addFavourite(event: event, emit: emit));
    });
    on<RemoveApodEvent>((event, emit) async {
      emit(await _removeFavourite(event: event, emit: emit));
    });
    on<InitApodEvent>((event, emit) async {
      emit(await _isFavourite(event: event, emit: emit));
    });
  }

  Future<GetApodState> _addFavourite({
    required AddApodEvent event,
    required Emitter<ApodState> emit,
  }) async {
    emit(LoadingApodState());
    final result = await addFavouriteUseCase(
        ParamsUseCaseAddFavourite(apodEntity: event.apodEntity));

    return result.fold(
      (l) {
        emit(FailedApodState());
        emit(InitApodState());
        return GetApodState(isFavourite: false);
      },
      (resp) {
        emit(SuccessApodState(isFavourite: true));
        return GetApodState(isFavourite: true);
      },
    );
  }

  Future<GetApodState> _removeFavourite({
    required RemoveApodEvent event,
    required Emitter<ApodState> emit,
  }) async {
    emit(LoadingApodState());
    final result = await removeFavouriteUseCase(
        ParamsUseCaseRemoveFavourite(apodEntity: event.apodEntity));

    return result.fold(
      (l) {
        emit(FailedApodState());
        emit(InitApodState());
        return GetApodState(isFavourite: true);
      },
      (resp) {
        emit(SuccessApodState(isFavourite: false));
        return GetApodState(isFavourite: false);
      },
    );
  }

  Future<GetApodState> _isFavourite({
    required InitApodEvent event,
    required Emitter<ApodState> emit,
  }) async {
    final result = await isFavouriteUseCase(
        ParamsUseCaseIsFavourite(apodEntity: event.apodEntity));

    return result.fold(
      (l) {
        return GetApodState(isFavourite: false);
      },
      (resp) {
        return GetApodState(isFavourite: resp.response);
      },
    );
  }
}
