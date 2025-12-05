import 'package:e_commerce_fruits_hub/core/helper_functions.dart/get_user_data_from_prefs.dart';
import 'package:e_commerce_fruits_hub/featurs/check%20out/data/models/order_product_model.dart';
import 'package:e_commerce_fruits_hub/featurs/check%20out/data/models/shipping_address_model.dart';
import 'package:e_commerce_fruits_hub/featurs/check%20out/domain/entitys/order_entity.dart';
import 'package:uuid/uuid.dart';

class OrderModel {
  // this is the model that will be sent to the server
  final String uId;
  final double totalPrice;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProductModelList;
  final String paymentMethod;
  final String orderId;
  final String userName;

  OrderModel({
    required this.uId,
    required this.userName,
    required this.orderId,
    required this.totalPrice,
    required this.shippingAddressModel,
    required this.orderProductModelList,
    required this.paymentMethod,
  });

  factory OrderModel.fromEntity(OrderEntity orderEntity) => OrderModel(
    // this is the model that will be sent to the server
    uId: orderEntity.uId,
    userName: getUserDataFromPrefs().name,
    orderId: Uuid().v4(), // generate unique id for order
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
    'state': 'Pending',
    'userName': userName,
    'date': DateTime.now().toString(),
    'orderId': orderId,
    'totalPrice': totalPrice,
    'shippingAddressModel': shippingAddressModel.toJson(),
    'orderProductModelList':
        orderProductModelList.map((e) => e.toJson()).toList(),
    'paymentMethod': paymentMethod,
  };
}
