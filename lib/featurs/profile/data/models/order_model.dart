import 'package:e_commerce_fruits_hub/featurs/check%20out/data/models/shipping_address_model.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/data/models/order_product_model.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/domain/entitiys/order_entity.dart';

class OrderModelForOrders {
  // this is the model that will be sent to the server
  final String uId;
  final double totalPrice;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModelforOrders> orderProductModelForOrdersList;
  final String paymentMethod;
  // final String state;
  final String orderId;
  final String userName;
  final String orderDate;

  OrderModelForOrders({
    required this.uId,
    required this.orderId,
    required this.orderDate,
    required this.userName,
    required this.totalPrice,
    required this.shippingAddressModel,
    required this.orderProductModelForOrdersList,
    // required this.state,
    required this.paymentMethod,
  });

  factory OrderModelForOrders.fromJson(Map<String, dynamic> json) =>
      OrderModelForOrders(
        uId: json['uId'],
        orderId: json['orderId'],
        totalPrice: json['totalPrice'],
        orderDate: json['date'],
        userName: json['userName'],
        // state: json['state'],
        shippingAddressModel: ShippingAddressModel.fromJson(
          json['shippingAddressModel'],
        ),
        orderProductModelForOrdersList: List<OrderProductModelforOrders>.from(
          json['orderProductModelList'].map(
            (x) => OrderProductModelforOrders.fromJson(x),
          ),
        ),
        paymentMethod: json['paymentMethod'],
      );

  OrderEntityForOrderForOrders toEntity() => OrderEntityForOrderForOrders(
    uId: uId,
    orderId: orderId,
    userName: userName,
    orderDate: orderDate,
    // state: fetchOrderStatesEnum(state),
    totalPrice: totalPrice,
    shippingAddressEntity: shippingAddressModel.toEntity(),
    orderProductEntityList:
        (orderProductModelForOrdersList.map((e) => e.toEntity()).toList()),
    paymentMethod: paymentMethod,
  );

  // OrderStatesEnum fetchOrderStatesEnum(String state) {
  //   switch (state) {
  //     case 'Pending':
  //       return OrderStatesEnum.pending;
  //     case 'accepted':
  //       return OrderStatesEnum.accepted;
  //     case 'delivered':
  //       return OrderStatesEnum.delivered;
  //     case 'cancelled':
  //       return OrderStatesEnum.cancelled;
  //     default:
  //       return OrderStatesEnum.pending;
  //   }
  // }
}
