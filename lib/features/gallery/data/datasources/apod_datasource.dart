import '../models/apod_model.dart';

abstract class ApodClient {
  Future<List<ApodModel>> getGallery();
  Future<ApodModel> getCalendar({required DateTime date});
}