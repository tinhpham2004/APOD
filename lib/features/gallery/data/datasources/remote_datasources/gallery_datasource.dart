import '../../../../apod/data/models/apod_model.dart';

abstract class GalleryClient {
  Future<List<ApodModel>> getGallery();
}