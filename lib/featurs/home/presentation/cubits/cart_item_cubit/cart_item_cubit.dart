import 'package:bloc/bloc.dart';
import 'package:e_commerce_fruits_hub/featurs/home/domin/entitis/card_item_entity.dart';
import 'package:equatable/equatable.dart';

part 'cart_item_state.dart';

class CartItemCubit extends Cubit<CartItemState> {
  CartItemCubit() : super(CartItemInitial());
  void updateCartItem(CardItemEntity cartItemEntity) {
    emit(CartItemUpdated(cartItemEntity));
  }
}
