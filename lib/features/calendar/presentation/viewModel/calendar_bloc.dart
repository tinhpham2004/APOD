import 'package:bloc/bloc.dart';
import '../../../apod/domain/entities/apod_entity.dart';
import '../../domain/usecases/get_calendar.dart';
import 'package:equatable/equatable.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarViewModel extends Bloc<CalendarEvent, CalendarState> {
  final GetCalendarUseCase getCalendarUseCase;

  CalendarViewModel(
    this.getCalendarUseCase,
  ) : super(InitGetCalendarState()) {
    on<GetCalendarEvent>((event, emit) async {
      emit(await _getCalendar(event: event, emit: emit));
    });
  }

  Future<GetCalendarState> _getCalendar({
    required GetCalendarEvent event,
    required Emitter<CalendarState> emit,
  }) async {
    emit(LoadingGetCalendarState());
    final result =
        await getCalendarUseCase(ParamsUseCaseGetCalendar(date: event.date));

    return result.fold(
      (l) {
        emit(FailedGetCalendarState());
        emit(InitGetCalendarState());
        return GetCalendarState(apodEntity: ApodEntity.empty());
      },
      (resp) {
        emit(
          SuccessGetCalendarState(apodEntities: [resp.response]),
        );
        return GetCalendarState(apodEntity: resp.response);
      },
    );
  }
}
