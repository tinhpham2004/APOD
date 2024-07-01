import 'package:apod/features/gallery/domain/entities/apod_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/usecases/get_gallery.dart';

part 'apod_event.dart';
part 'apod_state.dart';

class ApodViewModel extends Bloc<ApodEvent, ApodState> {
  final GetGalleryUseCase getGalleryUseCase;

  ApodViewModel({
    required this.getGalleryUseCase,
  }) : super(InitGetApodState()) {
    on<GetGalleryEvent>((event, emit) async {
      emit(await _getGallery(event: event, emit: emit));
    });
  }

  /// This method getApod balance from the stream
  Future<GetGallerState> _getGallery({
    required GetGalleryEvent event,
    required Emitter<ApodState> emit,
  }) async {
    emit(LoadingGetApodState());
    final result = await getGalleryUseCase(
      ParamsUseCaseGetGallery(page: event.page),
    );

    return result.fold(
      (l) {
        emit(FailedGetApodState());
        emit(InitGetApodState());
        return GetGallerState(
          apodEntities: [],
        );
      },
      (resp) {
        emit(
          SuccessGetApodState(apodEntities: resp.response),
        );
        return GetGallerState(apodEntities: resp.response);
      },
    );
  }
}
