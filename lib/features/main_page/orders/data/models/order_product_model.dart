import '../../domain/entities/models/order_product_entity.dart';

class OrderProductModel {
  final String code;
  final int quantity;
  final double price;
  final String imageUrl;
  final String name;

  OrderProductModel({
    required this.code,
    required this.quantity,
    required this.price,
    required this.imageUrl,
    required this.name,
  });

  factory OrderProductModel.fromJson(Map<String, dynamic> json) {
    return OrderProductModel(
      code: json['code'] as String,
      quantity: json['quantity'] as int,
      price: json['price'] as double,
      imageUrl: json['imageUrl'] as String,
      name: json['name'] as String,
    );
  }

  OrderProductEntity toEntity() {
    return OrderProductEntity(
        code: code,
        imageUrl: imageUrl,
        name: name,
        price: price,
        quantity: quantity);
  }
}























// class OrderProductModel {
//   final String name;
//   final String code;
//   final String imageUrl;
//   final double price;
//   final int quantity;

//   OrderProductModel({
//     required this.name,
//     required this.code,
//     required this.imageUrl,
//     required this.price,
//     required this.quantity,
//   });
//   factory OrderProductModel.fromJson(Map<String, dynamic> json) {
//     return OrderProductModel(
//         name: json['name'],
//         code: json['code'],
//         imageUrl: json['imageUrl'],
//         price: json['price'],
//         quantity: json['quantity']);
//   }

//   OrderProductEntity toEntity() {
//     return OrderProductEntity(
//         code: code,
//         imageUrl: imageUrl,
//         name: name,
//         price: price,
//         quantity: quantity);
//   }

//   toJson() {
//     return {
//       'name': name,
//       'code': code,
//       'imageUrl': imageUrl,
//       'price': price,
//       'quantity': quantity,
//     };
//   }
// }
