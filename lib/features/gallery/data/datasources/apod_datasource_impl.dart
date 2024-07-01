import 'package:apod/config/app_config.dart';

import '../../../../core/network/server_api_client.dart';
import '../models/apod_model.dart';
import 'apod_datasource.dart';

class ApodClientImpl implements ApodClient {
  final ServerApiClient apiClient;

  ApodClientImpl({
    required this.apiClient,
  });

  @override
  Future<List<ApodModel>> getGallery({required int page}) async {
    final startDate = DateTime.now()
        .subtract(Duration(days: page * AppConfig.LIMIT_PAGE_LOAD));
    final endDate = DateTime.now();

    final response = await apiClient.get(Uri.parse(
        '${AppConfig.BASE_URL}&start_date=${startDate.toIso8601String().split('T').first}&end_date=${endDate.toIso8601String().split('T').first}'));
    return (response.body as List).map((data) => ApodModel(
        date: data['date'],
        title: data['title'],
        url: data['url'],
        explanation: data['explanation'],
      )).toList();
  }
}
