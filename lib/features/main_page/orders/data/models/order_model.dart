import 'package:fruit_hub_dashboard/features/main_page/orders/data/models/order_product_model.dart';
import 'package:fruit_hub_dashboard/features/main_page/orders/data/models/shipping_address_model.dart';
import 'package:fruit_hub_dashboard/features/main_page/orders/domain/entities/models/order_product_entity.dart';
import '../../domain/entities/models/order_entity.dart';

class OrderModel {
  final double totalPrice;
  final String uid;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;

  OrderModel(
      {required this.totalPrice,
      required this.uid,
      required this.shippingAddressModel,
      required this.orderProducts,
      required this.paymentMethod});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
        totalPrice: json['totalPrice'],
        uid: json['uid'],
        shippingAddressModel:
            ShippingAddressModel.fromJson(json['shippingAddressModel']),
        orderProducts: json['orderProducts'].map(
          (e) {
            return OrderProductModel.fromJson(e);
          },
        ).toList(),
        paymentMethod: json['paymentMethod'].payWithCash! ? 'cash' : 'online');
  }

  toEntity() {
    return OrderEntity(
        totalPrice: totalPrice,
        orderProducts: orderProducts.map((e) => e.toEntity()).toList(),
        paymentMethod: paymentMethod,
        shippingAddressModel: shippingAddressModel.toEntity(),
        uid: uid);
  }

  toJson() {
    return {
      'totalPrice': totalPrice,
      'uid': uid,
      'shippingAddressModel': shippingAddressModel.toJson(),
      'orderProducts': orderProducts
          .map(
            (e) => e.toJson(),
          )
          .toList(),
      'status': 'pending',
      'paymentMethod': paymentMethod,
    };
  }
}
