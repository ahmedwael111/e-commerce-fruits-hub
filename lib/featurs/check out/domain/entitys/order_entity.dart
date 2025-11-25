import 'package:e_commerce_fruits_hub/featurs/check%20out/domain/entitys/shipping_address_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/home/domin/entitis/card_item_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/home/domin/entitis/cart_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';

class OrderEntity { // this used only to show date in check out views
  final String uId;
  final CartEntity cartEntity;
  bool? isPayCash;
  ShippingAddressEntity? shippingAddressEntity;

  OrderEntity(
    this.cartEntity, {
    this.isPayCash,
    required this.shippingAddressEntity,
    required this.uId,
  });

  double shippingCost() {
    if (isPayCash!) {
      return 30;
    } else {
      return 0;
    }
  }

  double shippingDiscount() {
    return 0;
  }

  double calculateTotalCartPriceAfterShippingCostAndDiscountCost() {
    return cartEntity.calculateTotalCartPrice() + shippingCost() - shippingDiscount();
  }
  
}
