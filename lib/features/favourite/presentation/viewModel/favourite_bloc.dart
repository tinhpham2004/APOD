import 'package:apod/features/apod/domain/usecases/is_favourite.dart';
import 'package:apod/features/apod/domain/usecases/remove_favourite.dart';
import 'package:bloc/bloc.dart';
import '../../../apod/domain/entities/apod_entity.dart';
import 'package:equatable/equatable.dart';

import '../../../apod/domain/usecases/add_favourite.dart';
import '../../domain/usecases/get_favourite.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteViewModel extends Bloc<FavouriteEvent, FavouriteState> {
  final GetFavouriteUseCase getFavouriteUseCase;

  FavouriteViewModel(
    this.getFavouriteUseCase,
  ) : super(InitGetFavouriteState()) {
    on<GetFavouriteEvent>((event, emit) async {
      emit(await _getFavourite(event: event, emit: emit));
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
}
