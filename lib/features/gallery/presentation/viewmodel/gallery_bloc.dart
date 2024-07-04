import 'package:apod/features/apod/domain/entities/apod_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/usecases/get_gallery.dart';

part 'gallery_event.dart';
part 'gallery_state.dart';

class GalleryViewModel extends Bloc<GalleryEvent, GalleryState> {
  final GetGalleryUseCase getGalleryUseCase;

  GalleryViewModel(
    this.getGalleryUseCase,
   ) : super(InitGetGalleryState()) {
    on<GetGalleryEvent>((event, emit) async {
      emit(await _getGallery(event: event, emit: emit));
    });
  }

  /// This method getApod balance from the stream
  Future<GetGalleryState> _getGallery({
    required GetGalleryEvent event,
    required Emitter<GalleryState> emit,
  }) async {
    emit(LoadingGetGalleryState());
    final result = await getGalleryUseCase(ParamsUseCaseGetGallery());

    return result.fold(
      (l) {
        emit(FailedGetApodState());
        emit(InitGetGalleryState());
        return GetGalleryState(
          apodEntities: [],
        );
      },
      (resp) {
        emit(
          SuccessGetGalleryState(apodEntities: resp.response),
        );
        return GetGalleryState(apodEntities: resp.response);
      },
    );
  }

}
