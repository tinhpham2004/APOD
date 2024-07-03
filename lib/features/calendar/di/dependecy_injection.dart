import '../../../core/di/injection.dart';
import '../data/datasources/calendar_datasource.dart';
import '../data/datasources/calendar_datasource_impl.dart';
import '../data/respositories/calendar_interface_impl.dart';
import '../domain/interfaces/calendar_interfaces.dart';
import '../domain/usecases/get_calendar.dart';
import '../presentation/viewModel/calendar_bloc.dart';

Future<void> initCalendar() async {
  getIt.registerLazySingleton(() => CalendarViewModel(getIt()));

  getIt.registerLazySingleton(() => GetCalendarUseCase(repository: getIt()));

  getIt.registerLazySingleton<CalendarClient>(
      () => CalendarClientImpl(apiClient: getIt()));

  getIt.registerLazySingleton<CalendarInterface>(
      () => CalendarInterfaceImpl(calendarClient: getIt()));
}
