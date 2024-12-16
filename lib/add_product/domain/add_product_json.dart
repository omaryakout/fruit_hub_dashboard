import 'dart:io';

import 'package:fruit_hub_dashboard/add_product/domain/add_product_input_entity.dart';
import 'package:fruit_hub_dashboard/add_product/domain/review_entity.dart';
import 'package:fruit_hub_dashboard/add_product/domain/review_json.dart';

class AddProductJson {
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
  final num ratingCount;
  final int unitAmount;
  final List<ReviewJson> reviews;
  final String? url;
  AddProductJson(
      {required this.name,
      required this.description,
      required this.price,
      required this.code,
      required this.image,
      required this.isFeatured,
      required this.expirationDate,
      required this.isOrganic,
      required this.numberOfCalories,
      required this.ratingCount,
      required this.unitAmount,
      required this.reviews,
      required this.url});

  factory AddProductJson.fromEntity(
      AddProductInputEntity addProductInputEntity) {
    return AddProductJson(
        name: addProductInputEntity.name,
        description: addProductInputEntity.description,
        price: addProductInputEntity.price,
        code: addProductInputEntity.code,
        image: addProductInputEntity.image,
        isFeatured: addProductInputEntity.isFeatured,
        expirationDate: addProductInputEntity.expirationDate,
        isOrganic: addProductInputEntity.isOrganic,
        numberOfCalories: addProductInputEntity.numberOfCalories,
        ratingCount: addProductInputEntity.ratingCount,
        unitAmount: addProductInputEntity.unitAmount,
        reviews: addProductInputEntity.reviews.map((e) => ReviewJson.fromEntity(e)).toList(),
        url: addProductInputEntity.url);
  }

  toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'code': code,
      'image': url,
      'isFeatured': isFeatured,
      'isOrganic': isOrganic,
      'numberOfCalories': numberOfCalories,
      'ratingCount': ratingCount,
      ' unitAmount': unitAmount,
      'reviews':reviews.map((e) => e.toJson(),).toList()
    };
  }
}
