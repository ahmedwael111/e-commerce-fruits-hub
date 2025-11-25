import 'package:e_commerce_fruits_hub/featurs/check%20out/domain/entitys/order_entity.dart';

import 'amount.dart';
import 'item_list.dart';

class PaymentPayPalEntity { // this class is for making maping between order entity and payment pay pal entity
  Amount? amount;
  String? description;
  ItemList? itemList;

  PaymentPayPalEntity({this.amount, this.description, this.itemList});

  factory PaymentPayPalEntity.fromEntity(OrderEntity orderEntity) { // map from order entity to payment pay pal entity after making maping in "amount" and 'item list
    return PaymentPayPalEntity(
      amount: Amount.fromEntity(orderEntity),
      description: 'The payment transaction description.',
      itemList: ItemList.fromEntity(orderEntity.cartEntity.cardItems),
    );
  }

  Map<String, dynamic> toJson() => {
    'amount': amount?.toJson(),
    'description': description,
    'item_list': itemList?.toJson(),
  };
}
