import 'package:e_commerce_fruits_hub/featurs/check%20out/domain/entitys/shipping_address_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/domain/entitiys/order_product_entity.dart';

class OrderEntityForOrderForOrders {
  // this is the model that will be sent to the server
  final String uId;
  final double totalPrice;
  final ShippingAddressEntity shippingAddressEntity;
  final List<OrderProductEntityForModel> orderProductEntityList;
  final String paymentMethod;
  // final OrderStatesEnum state;
  final String orderId;
  final String userName;
  final String orderDate;

  OrderEntityForOrderForOrders({
    required this.uId,
    required this.userName,
    required this.orderDate,
    required this.orderId,
    // required this.state,
    required this.totalPrice,
    required this.shippingAddressEntity,
    required this.orderProductEntityList,
    required this.paymentMethod,
  });
}
