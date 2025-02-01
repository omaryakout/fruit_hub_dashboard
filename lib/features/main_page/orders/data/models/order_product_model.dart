import '../../domain/entities/models/order_product_entity.dart';

class OrderProductModel {
  final String name;
  final String code;
  final String imageUrl;
  final double price;
  final int quantity;

  OrderProductModel({
    required this.name,
    required this.code,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });
  factory OrderProductModel.fromJson(Map<String, dynamic> json) {
    return OrderProductModel(
        name: json['name'],
        code: json['code'],
        imageUrl: json['imageUrl'],
        price: json['price'],
        quantity: json['count']);
  }

   OrderProductEntity toEntity() {
    return OrderProductEntity(
        code: code,
        imageUrl: imageUrl,
        name: name,
        price: price,
        quantity: quantity);
  }

  toJson() {
    return {
      'name': name,
      'code': code,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
    };
  }
}
