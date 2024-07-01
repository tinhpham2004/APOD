import 'package:equatable/equatable.dart';

class ApodEntity extends Equatable {
  final String date;
  final String title;
  final String url;
  final String explanation;

  ApodEntity({
    required this.date,
    required this.title,
    required this.url,
    required this.explanation,
  });

  factory ApodEntity.empty() {
    return ApodEntity(
      date: "",
      title: "",
      url: "",
      explanation: "",
    );
  }

  @override
  List<Object?> get props => [
      date,
      title,
      url,
      explanation,
      ];
}
