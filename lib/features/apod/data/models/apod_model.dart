import 'package:apod/features/apod/domain/entities/apod_entity.dart';

class ApodModel extends ApodEntity {
  ApodModel({
    required super.date,
    required super.title,
    required super.url,
    required super.explanation,
    required super.media_type,
    required super.thumbnail_url,
  });

  factory ApodModel.fromJson(Map<String, dynamic> json) {
    List<String> categories = [];

    if (json.containsKey('categories')) {
      List<dynamic> inconmingCategories = json['categories'] as List;
      for (var element in inconmingCategories) {
        categories.add(element);
      }
    }

    return ApodModel(
      date: json['date'] ?? '',
      title: json['title'] ?? '',
      url: json['url'] ?? '',
      explanation: json['explanation'] ?? '',
      media_type: json['media_type'] ?? '',
      thumbnail_url: json['thumbnail_url'] ?? '',
    );
  }
}
