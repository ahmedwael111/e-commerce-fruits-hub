import 'package:bloc/bloc.dart';
import 'package:e_commerce_fruits_hub/core/entities/product_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/home/domin/entitis/card_item_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/home/domin/entitis/cart_entity.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartEntity cartEntity = CartEntity(cardItems: []);

  void addToCart(ProductEntity productEntity) {
    bool isProductExist =
        cartEntity.isExistInCart(productEntity);
        var cartItem = cartEntity.getCardItemByProduct(productEntity);
    if (isProductExist) {
      cartItem.incementQuantity(); // Increase quantity if already in cart
    } else {
      
      cartEntity.addCardItem(cartItem); // Add new item to cart
    }
    emit(CartItemAdded());
  }

  void removeCartItem(CardItemEntity cardItemEntity) {
    cartEntity.removeCardItem(cardItemEntity);
    emit(CartItemRemoved());
  }
}
