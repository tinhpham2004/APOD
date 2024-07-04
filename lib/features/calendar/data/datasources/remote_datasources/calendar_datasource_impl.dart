import 'dart:convert';

import 'package:apod/features/calendar/data/datasources/remote_datasources/calendar_datasource.dart';

import '../../../../../config/app_config.dart';
import '../../../../../core/network/server_api_client.dart';
import '../../../../apod/data/models/apod_model.dart';

class CalendarClientImpl implements CalendarClient {
  final ServerApiClient apiClient;

  CalendarClientImpl({
    required this.apiClient,
  });

  @override
  Future<ApodModel> getCalendar({required DateTime date}) async {
    final Map<String, String> _queryParameters = <String, String>{
      'api_key': AppConfig.NASA_KEY,
      'date': '${date.toIso8601String().split('T').first}',
      'thumbs': 'True',
    };
    final response = await apiClient.get('/${AppConfig.BASE_URL}',
        queryParameters: _queryParameters);
    print(ApodModel.fromJson(jsonDecode(response.body)).date);
    return ApodModel.fromJson(jsonDecode(response.body));
  }
}
