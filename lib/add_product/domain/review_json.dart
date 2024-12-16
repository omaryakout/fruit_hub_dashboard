import 'package:fruit_hub_dashboard/add_product/domain/review_entity.dart';

class ReviewJson {
  final String name;
  final String image;
  final num ratting;
  final String date;
  final String reviewDescription;

  ReviewJson(
      {required this.name,
      required this.image,
      required this.ratting,
      required this.date,
      required this.reviewDescription});

  factory ReviewJson.fromEntity(ReviewEntity reviewEntity) {
    return ReviewJson(
        name: reviewEntity.name,
        image: reviewEntity.image,
        ratting: reviewEntity.ratting,
        date: reviewEntity.date,
        reviewDescription: reviewEntity.reviewDescription);
  }

  fromJson(Map<String, dynamic> json) {
    return [
      ReviewJson(
          name: json['name'],
          image: json['image'],
          ratting: json['ratting'],
          date: json['date'],
          reviewDescription: json['reviewDescription'])
    ];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'ratting': ratting,
      'date': date,
      'reviewDescription': reviewDescription
    };
  }
}
