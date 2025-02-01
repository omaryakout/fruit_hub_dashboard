
import 'package:fruit_hub_dashboard/features/main_page/orders/domain/entities/models/shipping_address_entity.dart';

class ShippingAddressModel {
  String? name;
  String? email;
  String? address;
  String? city;
  String? address2;
  String? phoneNumber;

  ShippingAddressModel({
    this.name,
    this.email,
    this.address,
    this.city,
    this.address2,
    this.phoneNumber,
  });

  factory ShippingAddressModel.fromJson(
      Map<String,dynamic>json) {
    return ShippingAddressModel(
        address2: json['address2'],
        address: json['address'],
        city: json['city'],
        email: json['email'],
        name:json['name'],
        phoneNumber: json['phoneNumber']);
  }

  toJson() {
    return {
      'address2': address2,
      'address': address,
      'city': city,
      'email': email,
      'name': name,
      'phoneNumber': phoneNumber,
    };
  }

   toEntity() {
    return ShippingAddressEntity(
      name: name,
     phoneNumber: phoneNumber,
      address: address,
      address2:address2 ,
      city: city,
      email: email,
    );
  }
}
