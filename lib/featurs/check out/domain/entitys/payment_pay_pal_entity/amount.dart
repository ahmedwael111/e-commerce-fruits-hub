import 'package:e_commerce_fruits_hub/core/helper_functions.dart/get_currency.dart';
import 'package:e_commerce_fruits_hub/featurs/check%20out/domain/entitys/order_entity.dart';

import 'details.dart';

class Amount {
  String? total;
  String? currency;
  Details? details;

  Amount({this.total, this.currency, this.details});

  factory Amount.fromEntity(OrderEntity orderEntity) => Amount(
    total: orderEntity
        .calculateTotalCartPriceAfterShippingCostAndDiscountCost()
        .toStringAsFixed(2),
    currency: getCurrency(),
    details: Details.fromEntity(orderEntity),
  );
  Map<String, dynamic> toJson() => {
    
    'total': total,
    'currency': currency,
    'details': details?.toJson(),
  };
}
