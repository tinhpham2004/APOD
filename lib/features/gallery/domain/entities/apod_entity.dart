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
