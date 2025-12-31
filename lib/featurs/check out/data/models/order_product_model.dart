import 'package:e_commerce_fruits_hub/core/entities/product_entity.dart';
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
    code: cardItemEntity.productEntity.productId,
    title: cardItemEntity.productEntity.name,
    quantity: cardItemEntity.quantity,
    price: cardItemEntity.productEntity.price.toDouble(),
    image: cardItemEntity.productEntity.imageUrl!,
  );
  toEntity() {
    return CardItemEntity(
      productEntity: ProductEntity(
        productId: code,
        name: title,
       
        price: price,
        imageUrl: image,
        unitAmount: 1,
        isOrganic: false,
        expirationMonth: 0,
        isFeatured: false,
        numberOfCalorys: 0,
        ratingCount: 0,
        avrageRate: 0,
        reviews: [],
        description: '',
        sellingCount: 0,
      ),
      quantity: quantity,
    );
  }

  toJson() => {
    'code': code,
    'title': title,
    'quantity': quantity,
    'price': price,
    'image': image,
  };
}
