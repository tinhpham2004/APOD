import 'package:apod/features/apod/domain/entities/apod_entity.dart';

import '../../../../apod/data/models/apod_model.dart';

abstract class FavouriteClient {
  Future<List<ApodEntity>> getFavourite();
}
