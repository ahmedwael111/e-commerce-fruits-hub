import 'package:e_commerce_fruits_hub/featurs/check%20out/domain/entitys/shipping_address_entity.dart';

class ShippingAddressModel {
  String? name;
  String? email;
  String? address;
  String? city;
  String? phoneNumber;
  String? addressDeitails;

  ShippingAddressModel({
    this.name,
    this.email,
    this.address,
    this.city,
    this.phoneNumber,
    this.addressDeitails,
  });
  factory ShippingAddressModel.fromEntity(ShippingAddressEntity entity) =>
      ShippingAddressModel(
        // convert entity to model
        name: entity.name,
        email: entity.email,
        address: entity.address,
        city: entity.city,
        phoneNumber: entity.phoneNumber,
        addressDeitails: entity.addressDeitails,
      );
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
}
