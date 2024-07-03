import 'dart:convert';

import 'package:apod/features/calendar/data/datasources/remote_datasources/calendar_datasource.dart';

import '../../../../../core/network/server_api_client.dart';
import '../../../../gallery/data/models/apod_model.dart';

class CalendarClientImpl implements CalendarClient {
  final ServerApiClient apiClient;

  CalendarClientImpl({
    required this.apiClient,
  });

  @override
  Future<ApodModel> getCalendar({required DateTime date}) async {
    // final Map<String, String> _queryParameters = <String, String>{
    //   'api_key': 'Z3jwfvKezfiV5axB9Cd84wWWeNj8ZJnOKmxN1GbC',
    //   'date': '${date.toIso8601String().split('T').first}',
    //   'thumbs': 'True',
    // };
    // final response = await apiClient.get('/${AppConfig.BASE_URL}',
    //     queryParameters: _queryParameters);
    // print(ApodModel.fromJson(jsonDecode(response.body)).date);
    // return ApodModel.fromJson(jsonDecode(response.body));
    String data =
        '{"date":"2024-07-02","explanation":"The clouds may look like an oyster, and the stars like pearls, but look beyond. Near the outskirts of the Small Magellanic Cloud, a satellite galaxy some 200 thousand light-years distant, lies this 5 million year old star cluster NGC 602. Surrounded by its birth shell of gas and dust, star cluster NGC 602 is featured in this stunning Hubble image, augmented in a rollover by images in the X-ray by the Chandra Observatory and in the infrared by Spitzer Telescope. Fantastic ridges and swept back gas strongly suggest that energetic radiation and shock waves from NGC 602\'s massive young stars have eroded the dusty material and triggered a progression of star formation moving away from the star cluster\'s center. At the estimated distance of the Small Magellanic Cloud, the featured picture spans about 200 light-years, but a tantalizing assortment of background galaxies are also visible in this sharp view. The background galaxies are hundreds of millions of light-years -- or more -- beyond NGC 602.","hdurl":"https://apod.nasa.gov/apod/image/2407/Ngc602_ChandraHubbleSpitzer_3600.jpg","media_type":"image","service_version":"v1","title":"NGC 602: Oyster Star Cluster","url":"https://apod.nasa.gov/apod/image/2407/Ngc602_Hubble_960.jpg"}';
    ApodModel result = ApodModel.fromJson(jsonDecode(data));
    return result;
  }
}
