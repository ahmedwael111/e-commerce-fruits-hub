

import 'package:e_commerce_fruits_hub/featurs/check%20out/domain/entitys/shipping_address_entity.dart';

class ShippingAddressModelforOrders {
  String? name;
  String? email;
  String? address;
  String? city;
  String? phoneNumber;
  String? addressDeitails;

  ShippingAddressModelforOrders({
    this.name,
    this.email,
    this.address,
    this.city,
    this.phoneNumber,
    this.addressDeitails,
  });
  factory ShippingAddressModelforOrders.fromJson(Map<String, dynamic> json) {
    return ShippingAddressModelforOrders(
      name: json['name'],
      email: json['email'],
      address: json['address'],
      city: json['city'],
      phoneNumber: json['phoneNumber'],
      addressDeitails: json['addressDeitails'],
    );
  }
  @override
  String toString() {
    // TODO: implement toString
    return ' $address , $city  ,$addressDeitails';
  }

  toJson() => {
    'name': name,
    'email': email,
    'address': address,
    'city': city,
    'phoneNumber': phoneNumber,
    'addressDeitails': addressDeitails,
  };

  ShippingAddressEntity toEntity() => ShippingAddressEntity(
    name: name,
    email: email,
    address: address,
    city: city,
    phoneNumber: phoneNumber,
    addressDeitails: addressDeitails,
  );
}
