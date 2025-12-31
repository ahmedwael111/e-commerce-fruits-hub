import 'package:e_commerce_fruits_hub/featurs/profile/domain/entitiys/order_product_entity.dart';

class OrderProductModelforOrders {
  //
  final String code;
  final String title;
  final int quantity;
  final num price;
  final String image;
  OrderProductModelforOrders({
    required this.code,
    required this.title,
    required this.quantity,
    required this.price,
    required this.image,
  });
  factory OrderProductModelforOrders.fromJson(Map<String, dynamic> json) =>
      OrderProductModelforOrders(
        code: json['code'],
        title: json['title'],
        quantity: json['quantity'],
        price: json['price'],
        image: json['image'],
      );

  toJson() => {
    'code': code,
    'title': title,
    'quantity': quantity,
    'price': price,
    'image': image,
  };
  OrderProductEntityForModel toEntity() => OrderProductEntityForModel(
    code: code,
    title: title,
    quantity: quantity,
    price: price,
    image: image,
  );
}
