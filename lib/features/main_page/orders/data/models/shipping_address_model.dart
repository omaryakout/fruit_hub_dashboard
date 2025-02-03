import 'package:fruit_hub_dashboard/features/main_page/orders/domain/entities/models/shipping_address_entity.dart';

class ShippingAddressModel {
  final String phoneNumber;
  final String address;
  final String city;
  final String address2;
  final String name;
  final String email;

  ShippingAddressModel({
    required this.phoneNumber,
    required this.address,
    required this.city,
    required this.address2,
    required this.name,
    required this.email,
  });

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) {
    return ShippingAddressModel(
      phoneNumber: json['phoneNumber'] as String,
      address: json['address'] as String,
      city: json['city'] as String,
      address2: json['address2'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }

  ShippingAddressEntity toEntity() {
    return ShippingAddressEntity(
      phoneNumber: phoneNumber,
      address: address,
      city: city,
      address2: address2,
      name: name,
      email: email,
    );
  }
}




















// class ShippingAddressModel {
//   String? name;
//   String? email;
//   String? address;
//   String? city;
//   String? address2;
//   int? phoneNumber;

//   ShippingAddressModel({
//     this.name,
//     this.email,
//     this.address,
//     this.city,
//     this.address2,
//     this.phoneNumber,
//   });

//   factory ShippingAddressModel.fromJson(Map<String, dynamic> json) {
//     return ShippingAddressModel(
//         address2: json['address2'],
//         address: json['address'],
//         city: json['city'],
//         email: json['email'],
//         name: json['name'],
//         phoneNumber: json['phoneNumber']);
//   }

//   toJson() {
//     return {
//       'address2': address2,
//       'address': address,
//       'city': city,
//       'email': email,
//       'name': name,
//       'phoneNumber': phoneNumber,
//     };
//   }

//   toEntity() {
//     return ShippingAddressEntity(
//       name: name,
//       phoneNumber: phoneNumber,
//       address: address,
//       address2: address2,
//       city: city,
//       email: email,
//     );
//   }
// }
