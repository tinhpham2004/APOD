import 'package:apod/features/gallery/domain/entities/apod_entity.dart';

class ApodModel extends ApodEntity {
  ApodModel({
    required super.date,
    required super.title,
    required super.url,
    required super.explanation,
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
    );
  }
}