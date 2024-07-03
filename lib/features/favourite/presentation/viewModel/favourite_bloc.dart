import 'package:apod/features/favourite/domain/usecases/is_favourite.dart';
import 'package:apod/features/favourite/domain/usecases/remove_favourite.dart';
import 'package:bloc/bloc.dart';
import '../../../gallery/domain/entities/apod_entity.dart';
import 'package:equatable/equatable.dart';

import '../../domain/usecases/add_favourite.dart';
import '../../domain/usecases/get_favourite.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteViewModel extends Bloc<FavouriteEvent, FavouriteState> {
  final GetFavouriteUseCase getFavouriteUseCase;
  final AddFavouriteUseCase addFavouriteUseCase;
  final RemoveFavouriteUseCase removeFavouriteUseCase;
  final IsFavouriteUseCase isFavouriteUseCase;

  FavouriteViewModel(
    this.getFavouriteUseCase,
    this.addFavouriteUseCase,
    this.removeFavouriteUseCase,
    this.isFavouriteUseCase,
  ) : super(InitGetFavouriteState()) {
    on<GetFavouriteEvent>((event, emit) async {
      emit(await _getFavourite(event: event, emit: emit));
    });
    on<AddFavouriteEvent>((event, emit) async {
      emit(await _addFavourite(event: event, emit: emit));
    });
    on<RemoveFavouriteEvent>((event, emit) async {
      emit(await _removeFavourite(event: event, emit: emit));
    });
    on<IsFavouriteEvent>((event, emit) async {
      emit(await _isFavourite(event: event, emit: emit));
    });
  }

  Future<GetFavouriteState> _getFavourite({
    required GetFavouriteEvent event,
    required Emitter<FavouriteState> emit,
  }) async {
    emit(LoadingGetFavouriteState());
    final result = await getFavouriteUseCase(ParamsUseCaseGetFavourite());

    return result.fold(
      (l) {
        emit(FailedGetFavouriteState());
        emit(InitGetFavouriteState());
        return GetFavouriteState(apodEntities: []);
      },
      (resp) {
        emit(SuccessGetFavouriteState(apodEntities: resp.response));
        return GetFavouriteState(apodEntities: resp.response);
      },
    );
  }

  Future<GetFavouriteState> _addFavourite({
    required AddFavouriteEvent event,
    required Emitter<FavouriteState> emit,
  }) async {
    emit(LoadingGetFavouriteState());
    final result = await addFavouriteUseCase(
        ParamsUseCaseAddFavourite(apodEntity: event.apodEntity));

    return result.fold(
      (l) {
        emit(FailedGetFavouriteState());
        emit(InitGetFavouriteState());
        return GetFavouriteState(apodEntities: []);
      },
      (resp) {
        emit(SuccessGetFavouriteState(apodEntities: resp.response));
        return GetFavouriteState(apodEntities: resp.response);
      },
    );
  }

  Future<GetFavouriteState> _removeFavourite({
    required RemoveFavouriteEvent event,
    required Emitter<FavouriteState> emit,
  }) async {
    emit(LoadingGetFavouriteState());
    final result = await removeFavouriteUseCase(
        ParamsUseCaseRemoveFavourite(apodEntity: event.apodEntity));

    return result.fold(
      (l) {
        emit(FailedGetFavouriteState());
        emit(InitGetFavouriteState());
        return GetFavouriteState(apodEntities: []);
      },
      (resp) {
        emit(SuccessGetFavouriteState(apodEntities: resp.response));
        return GetFavouriteState(apodEntities: resp.response);
      },
    );
  }

  Future<IsFavouriteState> _isFavourite({
    required IsFavouriteEvent event,
    required Emitter<FavouriteState> emit,
  }) async {
    final result = await isFavouriteUseCase(
        ParamsUseCaseIsFavourite(apodEntity: event.apodEntity));

    return result.fold(
      (l) {
        return IsFavouriteState(isFavourite: false);
      },
      (resp) {
        return IsFavouriteState(isFavourite: resp.response);
      },
    );
  }
}
