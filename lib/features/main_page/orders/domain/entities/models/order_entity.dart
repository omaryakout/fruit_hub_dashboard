
import 'package:fruit_hub_dashboard/features/main_page/orders/data/models/order_product_model.dart';
import 'package:fruit_hub_dashboard/features/main_page/orders/data/models/shipping_address_model.dart';

import 'order_product_entity.dart';
import 'shipping_address_entity.dart';

class OrderEntity {
  final double totalPrice;
  final String uid;
  final ShippingAddressEntity shippingAddressModel;
  final List<OrderProductEntity> orderProducts;
  final String paymentMethod;

  OrderEntity(
      {required this.totalPrice,
      required this.uid,
      required this.shippingAddressModel,
      required this.orderProducts,
      required this.paymentMethod});
}

// payment method
