import 'dart:convert';

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
  Future<List<ApodModel>> getGallery() async {
    try {
      final startDate = DateTime.now().subtract(Duration(days: 1));
      final endDate = DateTime.now();
      final Map<String, String> _queryParameters = <String, String>{
        'api_key': 'Z3jwfvKezfiV5axB9Cd84wWWeNj8ZJnOKmxN1GbC',
        'start_date': '${startDate.toIso8601String().split('T').first}',
        'end_date': '${endDate.toIso8601String().split('T').first}',
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
