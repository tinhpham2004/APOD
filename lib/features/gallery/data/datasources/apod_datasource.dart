import '../models/apod_model.dart';

abstract class ApodClient {
  Future<List<ApodModel>> getGallery();
}