import 'dart:io';

import 'package:fruit_hub_dashboard/add_product/domain/review_entity.dart';

class AddProductInputEntity {
  final String name;
  final String description;
  final num price;
  final String code;
  final File image;
  final bool isFeatured;
  final int expirationDate;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating = 0;
  final num ratingCount = 0;
  final int unitAmount ;
  final List<ReviewEntity> reviews;
  String? url;

  AddProductInputEntity({
    required this.name,
    required this.description,
    required this.price,
    required this.code,
    required this.image,
    required this.isFeatured,
    required this.expirationDate,
    required this.isOrganic,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.reviews,
    this.url,
  });
}
