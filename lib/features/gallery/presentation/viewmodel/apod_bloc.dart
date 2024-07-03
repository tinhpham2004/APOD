import 'package:apod/features/gallery/domain/entities/apod_entity.dart';
import 'package:apod/features/gallery/domain/usecases/get_calendar.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/usecases/get_gallery.dart';

part 'apod_event.dart';
part 'apod_state.dart';

class ApodViewModel extends Bloc<ApodEvent, ApodState> {
  final GetGalleryUseCase getGalleryUseCase;
  final GetCalendarUseCase getCalendarUseCase;

  ApodViewModel(
    this.getGalleryUseCase,
    this.getCalendarUseCase,
  ) : super(InitGetApodState()) {
    on<GetGalleryEvent>((event, emit) async {
      emit(await _getGallery(event: event, emit: emit));
    });

    on<GetCalendarEvent>((event, emit) async {
      emit(await _getCalendar(event: event, emit: emit));
    });
  }

  /// This method getApod balance from the stream
  Future<GetGalleryState> _getGallery({
    required GetGalleryEvent event,
    required Emitter<ApodState> emit,
  }) async {
    emit(LoadingGetApodState());
    final result = await getGalleryUseCase(ParamsUseCaseGetGallery());

    return result.fold(
      (l) {
        emit(FailedGetApodState());
        emit(InitGetApodState());
        return GetGalleryState(
          apodEntities: [],
        );
      },
      (resp) {
        emit(
          SuccessGetApodState(apodEntities: resp.response),
        );
        return GetGalleryState(apodEntities: resp.response);
      },
    );
  }

  Future<GetCalendarState> _getCalendar({
    required GetCalendarEvent event,
    required Emitter<ApodState> emit,
  }) async {
    emit(LoadingGetApodState());
    final result = await getCalendarUseCase(ParamsUseCaseGetCalendar(date: event.date));

    return result.fold(
      (l) {
        emit(FailedGetApodState());
        emit(InitGetApodState());
        return GetCalendarState(apodEntity: ApodEntity.empty());
      },
      (resp) {
        // emit(
        //   SuccessGetApodState(a: resp.response),
        // );
        return GetCalendarState(apodEntity: resp.response);
      },
    );
  }
}
