import 'dart:convert';

import 'package:apod/config/app_config.dart';

import '../../../../../core/network/server_api_client.dart';
import '../../../../apod/data/models/apod_model.dart';
import 'gallery_datasource.dart';

class GalleryClientImpl implements GalleryClient {
  final ServerApiClient apiClient;

  GalleryClientImpl({
    required this.apiClient,
  });

  @override
  Future<List<ApodModel>> getGallery() async {
    try {
      final startDate = DateTime.now().subtract(Duration(days: AppConfig.LIMIT_GALLERY_LOAD));
      final endDate = DateTime.now();
      final Map<String, String> _queryParameters = <String, String>{
        'api_key': AppConfig.NASA_KEY,
        'start_date': '${startDate.toIso8601String().split('T').first}',
        'end_date': '${endDate.toIso8601String().split('T').first}',
        'thumbs': 'True',
      };
      final response = await apiClient.get('/${AppConfig.BASE_URL}',
          queryParameters: _queryParameters);
      return (jsonDecode(response.body) as List)
          .map((data) => ApodModel.fromJson(data))
          .toList();
    } catch (e) {
      print(e);
      return [];
    }
  }
}
