import 'package:e_commerce_fruits_hub/featurs/check%20out/domain/entitys/shipping_address_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/home/domin/entitis/card_item_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/home/domin/entitis/cart_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';

class OrderEntity {
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
}
