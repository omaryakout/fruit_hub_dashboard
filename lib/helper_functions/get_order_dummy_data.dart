import '../features/main_page/orders/domain/entities/models/order_entity.dart';
import '../features/main_page/orders/domain/entities/models/order_product_entity.dart';
import '../features/main_page/orders/domain/entities/models/shipping_address_entity.dart';

OrderEntity getDummyOrder() {
  // Create a sample shipping address
  ShippingAddressEntity shippingAddress = ShippingAddressEntity(
    name: 'John Doe',
    phoneNumber: '123-456-7890',
    address: '123 Main St',
    address2: '5th Floor',
    city: 'New York',
    email: 'johndoe@example.com',
  );

  // Create a sample list of order products
  List<OrderProductEntity> orderProducts = [
    OrderProductEntity(
      name: 'Product A',
      code: 'A123',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/3a/Cat03.jpg',
      price: 49.99,
      quantity: 2,
    ),
    OrderProductEntity(
      name: 'Product B',
      code: 'B456',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/3a/Cat03.jpg',
      price: 29.99,
      quantity: 1,
    ),
    OrderProductEntity(
      name: 'Product C',
      code: 'C789',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/3a/Cat03.jpg',
      price: 19.99,
      quantity: 3,
    ),
  ];

  // Calculate total price
  double totalPrice = orderProducts.fold(
    0,
    (sum, product) => sum + (product.price * product.quantity),
  );
return OrderEntity(
    totalPrice: totalPrice,
    uid: 'user123',
    shippingAddressModel: shippingAddress,
    orderProducts: orderProducts,
    paymentMethod: 'Cash',
  );
  // Create and return the OrderModel
  
}
