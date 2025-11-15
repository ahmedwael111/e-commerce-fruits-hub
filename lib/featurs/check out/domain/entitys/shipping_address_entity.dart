class ShippingAddressEntity {
  String? name;
  String? email;
  String? address;
  String? city;
  String? phoneNumber;
  String? addressDeitails;

  ShippingAddressEntity({
    this.name,
    this.email,
    this.address,
    this.city,
    this.phoneNumber,
    this.addressDeitails,
  });

  @override
  String toString() {
    // TODO: implement toString
    return ' $address , $city  ,$addressDeitails';
  }
}
