import 'package:e_commerce_fruits_hub/featurs/home/domin/entitis/card_item_entity.dart';

import 'item.dart';

class ItemList {
  List<ItemEntity>? items;

  ItemList({this.items});

  factory ItemList.fromEntity(List<CardItemEntity> cardItems) =>
      ItemList(items: cardItems.map((e) => ItemEntity.fromEntity(e)).toList());

  Map<String, dynamic> toJson() => {
    'items': items?.map((e) => e.toJson()).toList(),
  };
}
