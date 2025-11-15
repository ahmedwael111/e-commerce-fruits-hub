import 'package:e_commerce_fruits_hub/core/entities/product_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/home/domin/entitis/card_item_entity.dart';

class CartEntity {
  final List<CardItemEntity> cardItems;
  CartEntity({required this.cardItems});
  addCardItem(CardItemEntity cardItem) {
    cardItems.add(cardItem);
  }

  removeCardItem(CardItemEntity cardItem) {
    cardItems.remove(cardItem);
  }

  double calculateTotalCartPrice() {
    double total = 0;
    for (var cardItem in cardItems) {
      total += cardItem.calculateTotalPrice();
    }
    return total;
  }

  bool isExistInCart(ProductEntity productEntity) {
    // Check if product exists in cart
    for (var cardItem in cardItems) {
      if (cardItem.productEntity == productEntity) {
        return true;
      }
    }
    return false;
  }

  CardItemEntity getCardItemByProduct(ProductEntity productEntity) {
    // Get cart item by product
    for (var cardItem in cardItems) {
      if (cardItem.productEntity == productEntity) {
        return cardItem;
      }
    }
    return CardItemEntity(
      productEntity: productEntity,
      quantity: 1,
    ); // Default return if not found by creating new cart item
  }
}
