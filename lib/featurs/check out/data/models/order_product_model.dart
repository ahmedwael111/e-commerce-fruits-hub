import 'package:e_commerce_fruits_hub/featurs/home/domin/entitis/card_item_entity.dart';

class OrderProductModel {
  //
  final String code;
  final String title;
  final int quantity;
  final double price;
  final String image;
  OrderProductModel({
    required this.code,
    required this.title,
    required this.quantity,
    required this.price,
    required this.image,
  });
  factory OrderProductModel.fromEntity(CardItemEntity cardItemEntity) => //
      OrderProductModel(
    code: cardItemEntity.productEntity.code,
    title: cardItemEntity.productEntity.name,
    quantity: cardItemEntity.quantity,
    price: cardItemEntity.productEntity.price.toDouble(),
    image: cardItemEntity.productEntity.imageUrl!,
  );

  toJson() => {
    'code': code,
    'title': title,
    'quantity': quantity,
    'price': price,
    'image': image,
  };
}
