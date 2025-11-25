import 'package:e_commerce_fruits_hub/featurs/check%20out/domain/entitys/order_entity.dart';

class Details {
  String? subtotal;
  String? shipping;
  int? shippingDiscount;

  Details({this.subtotal, this.shipping, this.shippingDiscount});

  factory Details.fromEntity(OrderEntity orderEntity) => Details(
    subtotal: orderEntity.cartEntity.calculateTotalCartPrice().toString(),
    shipping: orderEntity.shippingCost().toString(),
    shippingDiscount: orderEntity.shippingDiscount().toInt(),
  );

  Map<String, dynamic> toJson() => {
    'subtotal': subtotal,
    'shipping': shipping,
    'shipping_discount': shippingDiscount,
  };
}
