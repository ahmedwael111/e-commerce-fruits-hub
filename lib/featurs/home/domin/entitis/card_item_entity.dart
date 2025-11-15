import 'package:e_commerce_fruits_hub/core/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

class CardItemEntity extends Equatable {
  final ProductEntity productEntity;
  int quantity ;

  CardItemEntity({required this.productEntity, this.quantity = 0});

  num calculateTotalPrice() {
    return productEntity.price * quantity;
  }

  num calculateTotalWeight() {
    return productEntity.unitAmount * quantity;
  }

  incementQuantity() {
    quantity++;
  }

  decrementQuantity() {
    if (quantity > 0) {
      quantity--;
    }
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [productEntity];
}
