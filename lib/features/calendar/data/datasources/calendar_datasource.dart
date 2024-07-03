import '../../../gallery/data/models/apod_model.dart';

abstract class CalendarClient {
    Future<ApodModel> getCalendar({required DateTime date});
}
