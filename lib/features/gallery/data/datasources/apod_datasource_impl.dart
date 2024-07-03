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
      // final startDate = DateTime.now().subtract(Duration(days: 1));
      // final endDate = DateTime.now();
      // final Map<String, String> _queryParameters = <String, String>{
      //   'api_key': 'Z3jwfvKezfiV5axB9Cd84wWWeNj8ZJnOKmxN1GbC',
      //   'start_date': '${startDate.toIso8601String().split('T').first}',
      //   'end_date': '${endDate.toIso8601String().split('T').first}',
      //   'thumbs': 'True',
      // };
      // final response = await apiClient.get('/${AppConfig.BASE_URL}',
      //     queryParameters: _queryParameters);
      // return (jsonDecode(response.body) as List)
      //     .map((data) => ApodModel.fromJson(data))
      //     .toList();
      String data =
          '[{"copyright":"Tunc Tezel","date":"2024-06-29","explanation":"Rising opposite the setting Sun, June\'s Full Moon occurred within about 28 hours of the solstice. The Moon stays close to the Sun\'s path along the ecliptic plane and so while the solstice Sun climbed high in daytime skies, June\'s Full Moon remained low that night as seen from northern latitudes. In fact, the Full Moon hugs the horizon in this June 21 rooftop night sky view from Bursa, Turkey, constructed from exposures made every 10 minutes between moonrise and moonset. In 2024 the Moon also reached a major lunar standstill, an extreme in the monthly north-south range of moonrise and moonset caused by the precession of the Moon\'s orbit over an 18.6 year cycle. As a result, this June solstice Full Moon was at its southernmost moonrise and moonset along the horizon.","hdurl":"https://apod.nasa.gov/apod/image/2406/SolsMoon2024.jpg","media_type":"image","service_version":"v1","title":"A Solstice Moon","url":"https://apod.nasa.gov/apod/image/2406/SolsMoon2024c1024.jpg"},{"date":"2024-06-30","explanation":"About 12 seconds into this video, something unusual happens. The Earth begins to rise.  Never seen by humans before, the rise of the Earth over the limb of the Moon occurred about 55.5 years ago and surprised and amazed the crew of Apollo 8. The crew immediately scrambled to take still images of the stunning vista caused by Apollo 8\'s orbit around the Moon. The featured video is a modern reconstruction of the event as it would have looked were it recorded with a modern movie camera. The colorful orb of our Earth stood out as a familiar icon rising above a distant and unfamiliar moonscape, the whole scene the conceptual reverse of a more familiar moonrise as seen from Earth. To many, the scene also spoke about the unity of humanity: that big blue marble -- that\'s us -- we all live there. The two-minute video is not time-lapse -- this is the real speed of the Earth rising through the windows of Apollo 8. Seven months and three missions later, Apollo 11 astronauts would not only circle Earth\'s moon, but land on it.   NASA Administrator Remembers Earthrise Photographer William Anders","media_type":"video","service_version":"v1", "thumbnail_url":"https://img.youtube.com/vi/1R5QqhPq1Ik/0.jpg","title":"Earthrise: A Video Reconstruction","url":"https://www.youtube.com/embed/1R5QqhPq1Ik?rel=0"},{"date":"2024-07-01","explanation":"What\'s happened since the universe started? The time spiral shown here features a few notable highlights. At the spiral\'s center is the Big Bang, the place where time, as we know it, began about 13.8 billion years ago. Within a few billion years atoms formed, then stars formed from atoms, galaxies formed from stars and gas, our Sun formed, soon followed by our Earth, about 4.6 billion years ago.  Life on Earth begins about 3.8 billion years ago, followed by cells, then photosynthesis within a billion years.  About 1.7 billion years ago, multicellular life on Earth began to flourish.  Fish began to swim about 500 million years ago, and mammals began walking on land about 200 million years ago. Humans first appeared only about 6 million years ago, and made the first cities only about 10,000 years ago.  The time spiral illustrated stops there, but human spaceflight might be added, which started only 75 years ago, and useful artificial intelligence began to take hold within only the past few years.   Explore Your Universe: Random APOD Generator","hdurl":"https://apod.nasa.gov/apod/image/2407/TimeSpiral_Budassi_2500.jpg","media_type":"image","service_version":"v1","title":"Time Spiral","url":"https://apod.nasa.gov/apod/image/2407/TimeSpiral_Budassi_960.jpg"}]';
      List<ApodModel> result = (jsonDecode(data) as List)
          .map((data) => ApodModel.fromJson(data))
          .toList();
      return result;
    } catch (e) {
      print(e);
      return [];
    }
  }

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
