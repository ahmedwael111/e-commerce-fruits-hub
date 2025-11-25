import 'package:e_commerce_fruits_hub/core/helper_functions.dart/get_currency.dart';
import 'package:e_commerce_fruits_hub/featurs/home/domin/entitis/card_item_entity.dart';

class ItemEntity {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  ItemEntity({this.name, this.quantity, this.price, this.currency});

  factory ItemEntity.fromEntity(CardItemEntity cardItemEntity) => ItemEntity(
    name: cardItemEntity.productEntity.name,
    quantity: cardItemEntity.quantity,
    price: cardItemEntity.productEntity.price.toString(),
    currency: getCurrency(),
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'quantity': quantity,
    'price': price,
    'currency': currency,
  };
}
