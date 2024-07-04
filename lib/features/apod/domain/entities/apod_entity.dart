import 'package:equatable/equatable.dart';

class ApodEntity extends Equatable {
  final String date;
  final String title;
  final String url;
  final String explanation;
  final String media_type;
  final String thumbnail_url;

  ApodEntity({
    required this.date,
    required this.title,
    required this.url,
    required this.explanation,
    required this.media_type,
    required this.thumbnail_url,
  });

  factory ApodEntity.empty() {
    return ApodEntity(
      date: "",
      title: "",
      url: "",
      explanation: "",
      media_type: "",
      thumbnail_url: "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'title': title,
      'url': url,
      'explanation': explanation,
      'media_type': media_type,
      'thumbnail_url': thumbnail_url,
    };
  }

  factory ApodEntity.fromJson(Map<String, dynamic> json) {
    return ApodEntity(
      date: json['date'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
      explanation: json['explanation'] as String,
      media_type: json['media_type'] as String,
      thumbnail_url: json['thumbnail_url'] as String,
    );
  }

  @override
  List<Object?> get props => [
        date,
        title,
        url,
        explanation,
        media_type,
        thumbnail_url,
      ];
}
