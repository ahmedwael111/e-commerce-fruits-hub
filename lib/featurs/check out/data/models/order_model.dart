import 'package:e_commerce_fruits_hub/featurs/check%20out/data/models/order_product_model.dart';
import 'package:e_commerce_fruits_hub/featurs/check%20out/data/models/shipping_address_model.dart';
import 'package:e_commerce_fruits_hub/featurs/check%20out/domain/entitys/order_entity.dart';

class OrderModel {
  // this is the model that will be sent to the server
  final String uId;
  final double totalPrice;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProductModelList;
  final String paymentMethod;

  OrderModel({
    required this.uId,
    required this.totalPrice,
    required this.shippingAddressModel,
    required this.orderProductModelList,
    required this.paymentMethod,
  });

  factory OrderModel.fromEntity(OrderEntity orderEntity) => OrderModel( // this is the model that will be sent to the server 
    uId: orderEntity.uId,
    totalPrice: orderEntity.cartEntity.calculateTotalCartPrice(),
    shippingAddressModel: ShippingAddressModel.fromEntity(
      orderEntity.shippingAddressEntity!,
    ),
    orderProductModelList:
        orderEntity.cartEntity.cardItems
            .map((e) => OrderProductModel.fromEntity(e))
            .toList(),
    paymentMethod: orderEntity.isPayCash! ? 'Cash' : 'online With PayPal',
  );
  toJson() => {
    'uId': uId,
    'totalPrice': totalPrice,
    'shippingAddressModel': shippingAddressModel.toJson(),
    'orderProductModelList':
        orderProductModelList.map((e) => e.toJson()).toList(),
    'paymentMethod': paymentMethod,
  };
}
